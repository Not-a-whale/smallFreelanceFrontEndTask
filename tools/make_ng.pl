#!/usr/bin/env perl
# END { print "\nAll done. Press ENTER to exit. "; <STDIN>; }

BEGIN {
    use Cwd 'abs_path';
    use File::Basename;
    my $toolpath = abs_path(dirname(abs_path($0)));
    (my $lib = $toolpath) =~ s/\/lib\/.*/\/lib/;
    push @INC, ($toolpath, $lib);
    push @INC, '/usko/office/finance/scripts';
}

use strict;
use warnings FATAL => 'all';
use feature 'current_sub';
use v5.28.1;

use threads;
use threads::shared;

use Carp qw( confess longmess);
use Devel::Confess;    # give a stacktrace on any error
use Data::Dumper;
use Tie::IxHash;
use Try::Tiny;
use PHQ::CLI;          # this is homebrew CLI processor
use JSON;

use Cwd 'abs_path';    # for finding of the relative location of
use File::Basename;    # the templates folder

use IPC::Open3;        # for the asynchronous
use IO::Select;        # execution of dbicdump

$Data::Dumper::Terse = 1;

my $total_start = time();

my %ObjClassTypes : shared;
my %ArrClassTypes : shared;

my %EnumSetTypesSign : shared;
my %EnumSetTypesType : shared;

my $SMPLTYPE = undef;    # hash TYPENAME=>COERCE found in CLASS/API/Types/Simple.pl, COERCE is boolean
my $TYPEDATA = undef;

# ------------------------------------------------------------------------------------------------------------
my $CLI = ParseCLI(
    isfatal => 1,
    rules   => {
        dbuser => {isa => 'Str', required => 1, default => 'root',            comment => 'Database User'},
        dbpass => {isa => 'Str', required => 1, default => 'Nlvae4asd!',      comment => 'Database Password'},
        dbhost => {isa => 'Str', required => 1, default => 'balancer',        comment => 'Database Host or IP'},
        dbname => {isa => 'Str', required => 1, default => 'tms',             comment => 'Database Name'},
        class  => {isa => 'Str', required => 1, default => 'TMS',             comment => 'Name of the perl class'},
        dest   => {isa => 'Str', required => 1, default => 'lib',             comment => 'Library destination'},
        prove  => {isa => 'Str', required => 1, default => 't',               comment => 'Path to tests'},
        templt => {isa => 'Str', required => 1, default => 'tools/templates', comment => 'Template\'s folder'},
        single => {isa => 'Int', required => 1, default => 0,                 comment => 'Force single threaded'},

        build_tests => {isa => 'Int', required => 1, default => 0, comment => 'Build test as well'},

        types => {
            isa     => 'Str',
            comment => 'Use predefined types for "HAS" from the JSON file. Run -help for info'
        },
        tables => {
            isa     => 'Str',
            comment => 'Just process specific tables or classes, comma delimited, use with caution*'
        },
    }
);

# ----------------------------------------------------------------------------------------------------------------------
my $DESTROOT = "$$CLI{dest}/$$CLI{class}";
my $BASEAPI  = "$DESTROOT/API";
my $COREAPI  = "$BASEAPI/Core";
my $TYPESDIR = "$BASEAPI/Types";

my $TESTLIBS = "$DESTROOT/Test";
my $TESTCORE = "$TESTLIBS/Core";
my $PROVEDIR = $$CLI{prove} || "$$CLI{dest}/../t";

# ----------------------------------------------------------------------------------------------------------------------

unshift @INC, $$CLI{dest};

my $before_dump = time();
my $dbixpm      = RunDbicDump();
my $after_dump  = time();

confess "No tables processed" unless defined $dbixpm && ref($dbixpm) eq 'HASH' && scalar(%$dbixpm);

UpdateFromTemplate(template => "$$CLI{templt}/Schema.pm", target => "$$CLI{dest}/$$CLI{class}/Schema.pm");

print '-' x 80 . "\n";

my @ResultThreads = ();
foreach (values %$dbixpm) {
    if ($$CLI{single}) {
        UpdateFromTemplate(
            template => "$$CLI{templt}/Result.pm",
            target   => $_
        );
    } else {
        push @ResultThreads,
            threads->create(
            'UpdateFromTemplate',
            template => "$$CLI{templt}/Result.pm",
            target   => $_
            );
    }
}
ReadStaticTypes();
$_->join() foreach @ResultThreads;

# ----------------------------------------------------------------------------------------------------------------------
my $GLOB = undef;
print '-' x 80 . "\n";
require "$$CLI{class}/Schema.pm";
{
    my $DBIxClass = $$CLI{class} . '::Schema';
    my $Schema    = $DBIxClass->new();
    foreach my $class (sort keys %$dbixpm) {
        my $ResultSet    = $Schema->resultset($class);
        my $ResultSource = $ResultSet->result_source;

        $$GLOB{$class}{ColumnsList} = [sort $ResultSource->columns];
        $$GLOB{$class}{ColumnsInfo} = {map { $_, $ResultSource->column_info($_) } @{$$GLOB{$class}{ColumnsList}}};
        $$GLOB{$class}{RelateInfo}  = {map { $_, $ResultSource->relationship_info($_) } $ResultSource->relationships};
        $$GLOB{$class}{PrimaryKeys} = {map { $_, 1 } $ResultSource->primary_columns};
        $$GLOB{$class}{UniqueKeys}  = {$ResultSource->unique_constraints};
        $$GLOB{$class}{TableName}   = $ResultSource->name;
    }
    print "=" x 120 . "\n";
    print Dumper($GLOB);
    print "=" x 120 . "\n";
}

my @ApiThreads = ();
my $before_api = time();
if ($$CLI{single}) {
    BuildAPI(class => $_) foreach sort keys %$dbixpm;
} else {
    push @ApiThreads, threads->create('BuildAPI', class => $_) foreach sort keys %$dbixpm;
}
$_->join() foreach @ApiThreads;
my $after_api = time();

unless (exists $$CLI{tables} && defined $$CLI{tables}) {
    print '-' x 80 . "\n";
    my $ObjTypesThread = undef;
    if ($$CLI{single}) {
        BuildObjectTypes();
    } else {
        $ObjTypesThread = threads->create('BuildObjectTypes');
    }
    BuildComplexTypes();
    $ObjTypesThread->join if $ObjTypesThread;
} else {
    print "\nWARNING: types are not generated due to explicit list of tables!\n\n";
}

BuildEnumSetTypes();

print '-' x 80 . "\n";
my $total_end = time();
printf "DBIxDumpe: %d\nAPI Build: %d\nTotal: %d\n", $after_dump - $before_dump, $after_api - $before_api, $total_end - $total_start;

sub BuildEnumSetTypes {
    my $target = "$$CLI{dest}/$$CLI{class}/API/Types/Columns.pm";
    my $output = ReadTemplate('Columns.pm');
    my $tmplt  = {
        enum => ReadTemplate('Columns.enum.pm'),
        set  => ReadTemplate('Columns.set.pm'),
    };

    $DB::single = 2;
    foreach my $sig (keys %EnumSetTypesSign) {
        my $name = $EnumSetTypesSign{$sig};
        my $type = $EnumSetTypesType{$sig};
        my @data = map { defined $_ ? $_ : '' } split(':', $sig);
        my $text = $$tmplt{$type};
        my $opts = join(',', map {"'$_' => 1"} @data);
        my $list = join(',', map {"'$_'"} @data);
        $text =~ s/TYPENAME/$name/gs;
        $text =~ s/OPTIONS/$opts/gs;
        $text =~ s/LISTS/$list/gs;

        $output .= $text;
    }
    $output .= "\n1;\n";
    SaveFile($target, $output);
    `/usr/local/bin/perltidy "$target"`;
    `mv "$target.tdy" "$target"`;
}

sub ReadStaticTypes {
    if (defined $$CLI{types}) {
        confess "Types file error: $!" unless -f "$$CLI{types}";
        if (open(FT, "<$$CLI{types}")) {
            local $/ = undef;
            my $jsontext = <FT>;
            close(FT);
            $TYPEDATA = JSON->new->decode($jsontext);
        } else {
            confess "Unable to read \"$$CLI{types}\", $!";
        }

        my $types_file = "$TYPESDIR/Simple.pm";
        if (open(FI, "<$types_file")) {
            local $/ = undef;
            my $types_text = <FI>;
            close(FI);

            my @subtypes = ($types_text =~ /^subtype\s+['"]([^'"]+)['"]/gm);
            my %coerce   = map { $_, 1 } ($types_text =~ /^coerce\s+['"]([^'"]+)['"]/gm);
            foreach (@subtypes) {
                $$SMPLTYPE{$_} = exists $coerce{$_} ? 1 : 0;
            }
        } else {
            confess "Unable to read \"$types_file\", $!";
        }
    }
}

sub BuildComplexTypes {
    my $target       = "$$CLI{dest}/$$CLI{class}/API/Types/Complex.pm";
    my $CoreTemplate = ReadFile("$$CLI{templt}/Complex.pm");
    my $ObjTemplate  = ReadFile("$$CLI{templt}/ComplexType.pm");
    my $AllTypes     = '';

    foreach my $complextype (sort keys %ArrClassTypes) {
        my $temp      = $ObjTemplate;
        my $moosetype = $complextype;
        $moosetype =~ s/^Array//;

        $temp =~ s/MOOSETYPE/$moosetype/gs;
        $temp =~ s/COMPLEXTYPE/$complextype/gs;
        $temp =~ s/MOOSECLASS/$ArrClassTypes{$complextype}/gs;
        $AllTypes .= $temp;
    }

    $CoreTemplate =~ s/TYPESPLACEHOLDER/$AllTypes/s;

    SaveFile($target, $CoreTemplate);
    `/usr/local/bin/perltidy "$target"`;
    `mv "$target.tdy" "$target"`;
}

sub BuildObjectTypes {
    my $target       = "$$CLI{dest}/$$CLI{class}/API/Types/Objects.pm";
    my $CoreTemplate = ReadFile("$$CLI{templt}/Objects.pm");
    my $ObjTemplate  = ReadFile("$$CLI{templt}/ObjectType.pm");
    my $AllTypes     = '';

    foreach my $type (sort keys %ObjClassTypes) {
        my $temp = $ObjTemplate;
        $temp =~ s/MOOSETYPE/$type/gs;
        $temp =~ s/MOOSECLASS/$ObjClassTypes{$type}/gs;
        $AllTypes .= $temp;
    }

    $CoreTemplate =~ s/TYPESPLACEHOLDER/$AllTypes/s;

    SaveFile($target, $CoreTemplate);
    `/usr/local/bin/perltidy "$target"`;
    `mv "$target.tdy" "$target"`;
}

sub BuildAPI {
    my %args = @_;
    print "... building $args{class}\n";

    my @ColumnsList = @{$$GLOB{$args{class}}{ColumnsList}};
    my %ColumnsInfo = %{$$GLOB{$args{class}}{ColumnsInfo}};

    my %RelateInfo  = %{$$GLOB{$args{class}}{RelateInfo}};
    my %PrimaryKeys = %{$$GLOB{$args{class}}{PrimaryKeys}};
    my %UniqueKeys  = %{$$GLOB{$args{class}}{UniqueKeys}};
    my $TableName   = $$GLOB{$args{class}}{TableName};

    my %required     = ();
    my %fk_ties_cols = ();

    my $has_required = undef;
    my $has_optional = undef;
    my $has_commons  = undef;
    my $has_related  = undef;
    my $has_depended = undef;

    my %type_map = (
        'varchar'          => 'TidySpacesString',
        'text'             => 'TidySpacesString',
        'bigint'           => 'PositiveInt',
        'double precision' => 'Float',
        'char'             => 'TidySpacesString',
        'date'             => 'DATETIME',
        'datetime'         => 'DATETIME',
        'decimal'          => 'CurrencyValue',
        'float'            => 'Float',
        'integer'          => 'Int',
        'tinyint'          => 'BoolInt',

        'longblob'  => 'Any',
        'time'      => 'Any',
        'timestamp' => 'Any',
        'year'      => 'Any',
    );

    my %coerce = (
        'TidySpacesString' => 1,
        'PositiveInt'      => 1,
        'Float'            => 1,
        'TidySpacesString' => 1,
        'DATETIME'         => 1,
        'CurrencyValue'    => 1,
        'Int'              => 0,
        'BoolInt'          => 1,
    );

    my sub RefineIsa {
        my $cl  = shift;
        my $isa = $ColumnsInfo{$cl}{data_type};
        if (exists $$TYPEDATA{$TableName} && exists $$TYPEDATA{$TableName}{$cl}) {
            $isa = $$TYPEDATA{$TableName}{$cl};
            $coerce{$isa} = $$SMPLTYPE{$isa} if exists $$SMPLTYPE{$isa};
        } else {
            if ($isa eq 'enum' || $isa eq 'set') {
                my $list = $ColumnsInfo{$cl}{extra}{list};
                my $sign = join(':', map { lc($_) } sort @$list);
                my $name = $isa . '_' . $cl;

                if (!exists $EnumSetTypesSign{$sign}) {
                    { lock(%EnumSetTypesSign); $EnumSetTypesSign{$sign} = $name; }
                    { lock(%EnumSetTypesType); $EnumSetTypesType{$sign} = $isa; }
                }
                $isa = $EnumSetTypesSign{$sign};
                $coerce{$isa} = 1;
            } elsif (exists $PrimaryKeys{$cl}) {
                $isa = 'PrimaryKeyInt';
                $coerce{$isa} = 1;
            } else {
                $isa
                    = exists $type_map{$ColumnsInfo{$cl}{data_type}}
                    ? $type_map{$ColumnsInfo{$cl}{data_type}}
                    : $ColumnsInfo{$cl}{data_type};
            }
        }
        return $isa;
    }

    # process FKs
    foreach my $cl (sort keys %RelateInfo) {
        next if ref($RelateInfo{$cl}->{'cond'}) ne 'HASH';
        foreach (values %{$RelateInfo{$cl}->{'cond'}}) {
            s/^self.//;
            $fk_ties_cols{$_}++;
        }

        my $MooseClass = $RelateInfo{$cl}{class};
        my $MooseType  = $RelateInfo{$cl}{'attrs'}{'accessor'} eq 'multi' ? 'ArrayObj' : 'Obj';
        $MooseClass =~ s/.*:://g;
        $MooseType .= $MooseClass;
        $MooseClass = join('::', ($$CLI{class}, 'API', 'Core', $MooseClass));

        if ($RelateInfo{$cl}{'attrs'}{'accessor'} eq 'multi') {
            if (!exists $ArrClassTypes{$MooseType}) {
                lock(%ArrClassTypes);
                $ArrClassTypes{$MooseType} = $MooseClass;
            }
        } else {
            if (!exists $ObjClassTypes{$MooseType}) {
                lock(%ObjClassTypes);
                $ObjClassTypes{$MooseType} = $MooseClass;
            }
        }

        tie my %attr, 'Tie::IxHash',
            (
            is       => 'rw',
            isa      => $MooseType,
            coerce   => 1,
            required => 0
            );

        my $fk_code = "has '$cl' => (" . join(',', map {"'$_' => '$attr{$_}'"} keys %attr) . ');';

        if ($RelateInfo{$cl}{'attrs'}{'is_depends_on'} > 0) {
            push @$has_depended, $fk_code;
        } else {
            push @$has_related, $fk_code;
        }
    }

    # process reqiered fields
    foreach my $cl (
        grep {defined}
        map {
            (          $ColumnsInfo{$_}{'is_nullable'}
                    || exists $ColumnsInfo{$_}{'is_auto_increment'}
                    || exists $ColumnsInfo{$_}{'default_value'}
                    || exists $fk_ties_cols{$_})
                ? undef
                : $_
        }
        sort keys %ColumnsInfo
    ) {
        $required{$cl}++;

        my $isa = RefineIsa($cl);
        tie my %attr, 'Tie::IxHash',
            (
            is       => 'rw',
            isa      => $isa,
            coerce   => exists $coerce{$isa} ? $coerce{$isa} : 0,
            required => 1,
            );

        push @$has_required, "has '$cl' => (" . join(',', map {"'$_' => '$attr{$_}'"} keys %attr) . ');';
        $attr{required} = 0;
        push @$has_optional, "has '$cl' => (" . join(',', map {"'$_' => '$attr{$_}'"} keys %attr) . ');';
    }

    # use non required fields
    foreach my $cl (grep { !exists $required{$_} } @ColumnsList) {
        my $isa      = RefineIsa($cl);
        my $required = $ColumnsInfo{$cl}{'is_nullable'} ? 0 : 1;
        $required = 0 if exists $ColumnsInfo{$cl}{'is_auto_increment'};
        $required = 0
            if exists $ColumnsInfo{$cl}{'default_value'}
            && $ColumnsInfo{$cl}{'default_value'} eq 'CURRENT_TIMESTAMP';
        $required = 0 if exists $fk_ties_cols{$cl};

        tie my %attr, 'Tie::IxHash',
            (
            is       => 'rw',
            isa      => $isa,
            coerce   => exists $coerce{$isa} ? $coerce{$isa} : 0,
            required => $required,
            );

        $attr{default} = $ColumnsInfo{$cl}{'default_value'}
            if exists $ColumnsInfo{$cl}{'default_value'} && $ColumnsInfo{$cl}{'default_value'} ne 'CURRENT_TIMESTAMP';

        if (exists $attr{default}) {
            push @$has_required, "has '$cl' => (" . join(',', map {"'$_' => '$attr{$_}'"} keys %attr) . ');';
            $attr{required} = 0;
            delete $attr{default};
            push @$has_optional, "has '$cl' => (" . join(',', map {"'$_' => '$attr{$_}'"} keys %attr) . ');';
        } else {
            push @$has_commons, "has '$cl' => (" . join(',', map {"'$_' => '$attr{$_}'"} keys %attr) . ');';
        }
    }

    my $prefetch = join(' ', sort keys %RelateInfo);

    my $basehas = [];

    push @$basehas, @$has_commons if defined $has_commons;
    push @$basehas, ('# relations depends on',  @$has_depended) if defined $has_depended;
    push @$basehas, ('# relations point to us', @$has_related)  if defined $has_related;

    BuildCore(
        template => "$$CLI{templt}/CoreBase.pm",
        target   => "$$CLI{dest}/$$CLI{class}/API/Core/$args{class}.pm",
        class    => join('::', ($$CLI{class}, 'API', 'Core', "$args{class}")),
        dbix     => $args{class},
        hasattr  => $basehas,
        prefetch => $prefetch,
    );

    BuildCore(
        template => "$$CLI{templt}/CoreSearch.pm",
        target   => "$$CLI{dest}/$$CLI{class}/API/Core/$args{class}Search.pm",
        class    => join('::', ($$CLI{class}, 'API', 'Core', "$args{class}Search")),
        dbix     => $args{class},
        hasattr  => $has_optional,
        prefetch => $prefetch,
    );

    BuildCore(
        template => "$$CLI{templt}/CoreStrict.pm",
        target   => "$$CLI{dest}/$$CLI{class}/API/Core/$args{class}Strict.pm",
        class    => join('::', ($$CLI{class}, 'API', 'Core', "$args{class}Strict")),
        dbix     => $args{class},
        hasattr  => $has_required,
        prefetch => $prefetch,
    );

    #BuildTest
    if ($$CLI{build_tests}) {
        my $TestHash = AttributesHash(class => $args{class});
        my $Attrs    = Dumper($$TestHash{attr});
        my $Target   = "$$CLI{dest}/$$CLI{class}/Test/Core/$args{class}";
        my $TheUSE   = scalar(%{$$TestHash{uses}}) ? join("\n", map {"use $_;"} keys %{$$TestHash{uses}}) : '';

        foreach my $tag (qw(pm pl)) {
            my $data = ReadTemplate("TestCore.$tag");
            $data =~ s/DBIXCLASS/$args{class}/gs;
            $data =~ s/ATTRIBUTES/$Attrs/gs;
            $data =~ s/DEPENDENCYCLASSES/$TheUSE/g;

            SaveFile("$Target.$tag", $data);
            `/usr/local/bin/perltidy "$Target.$tag"`;
            `mv "$Target.$tag.tdy" "$Target.$tag"`;
        }
    }
}

sub AttributesHash {
    my %args = @_;
    my $idnt = exists $args{ident} ? $args{ident} : 0;
    my $tree = exists $args{tree} ? $args{tree} : {};
    my $uses = exists $args{uses} ? $args{uses} : {};
    my $glob = $$GLOB{$args{class}};
    my $info = $$glob{RelateInfo};
    my $tble = $$glob{TableName};

    tie %{$tree}, 'Tie::IxHash';

    print '.' x $idnt . "$args{class}\n";
    my %columns = map { $_, 1 } @{$$glob{ColumnsList}};
    delete $columns{$_} foreach keys %{$$glob{PrimaryKeys}};

    foreach my $fk (grep { $$info{$_}{'attrs'}{'is_depends_on'} > 0 } sort keys %$info) {

        # hack around BizCompanyNode biz_company_nodes table
        if( $$info{$fk}{class} =~ /BizCompanyNode/ ) {
            delete $columns{NodeId} if exists $columns{NodeId};
        }

        if (ref($$info{$fk}{'cond'}) eq 'HASH') {
            foreach (values %{$$info{$fk}{'cond'}}) {
                s/self\.//;
                delete $columns{$_} if exists $columns{$_};
            }
        }

        my $fkclass = $$info{$fk}{class};
        $fkclass =~ s/.*:://g;
        next if $args{class} eq $fkclass;

        my $moose = join('::', ($$CLI{class}, 'API', 'Core', $fkclass));
        $$uses{$moose} = 1;
        $$tree{$fk}    = {};
        __SUB__->(tree => $$tree{$fk}, class => $fkclass, uses => $uses, ident => $idnt + 1);
    }
    $$tree{$_} = ' ' foreach keys %columns;

    return ({attr => $tree, uses => $uses});
}

sub BuildCore {
    my %args     = @_;
    my $template = ReadFile($args{template});
    my $hastext  = '';
    $hastext = join("\n", @{$args{hasattr}}) if exists $args{hasattr} && defined $args{hasattr};
    $template =~ s/BUILD_THE_HAS_A/$hastext/s;
    $template =~ s/CLASSNAME/$args{class}/s;
    $template =~ s/DBIXCLASS/$args{dbix}/s;
    $template =~ s/PREFETCH/$args{prefetch}/s;
    SaveFile($args{target}, $template);
    `/usr/local/bin/perltidy "$args{target}"`;
    `mv "$args{target}.tdy" "$args{target}"`;
}

sub UpdateFromTemplate {
    my %args    = @_;
    my $tempate = ReadFile($args{template});
    my $target  = ReadFile($args{target});
    my $addon   = '';
    if (-f "$args{target}.addon") {
        $addon = ReadFile("$args{target}.addon");
    }

    print "... Updating $args{target}\n";
    $target =~ s/(# DO NOT MODIFY THIS OR ANYTHING[^\n]+).*/$1\n$addon\n$tempate/s;
    SaveFile($args{target}, $target);
    `/usr/local/bin/perltidy "$args{target}"`;
    `mv "$args{target}.tdy" "$args{target}"`;
}

sub RunDbicDump {
    $DB::single = 2;
    my @tables    = ();
    my $constr    = '';
    my $processed = {};

    @tables = map { s/^\s+|\s+$//g; $_ } split(',', $$CLI{tables}) if defined $$CLI{tables};
    $constr = ' -o constraint=\'qr/^(?:' . join('|', @tables) . ')$/\'' if @tables;

    my $cmd
        = "dbicdump"
        . " -o debug=1"
        . " -o overwrite_modifications=1"
        . " -o preserve_case=1"
        . " -o dump_directory=$$CLI{dest}"
        . " -o use_moose=1"
        . $constr
        . " $$CLI{class}::Schema"
        . " \"dbi:mysql:database=$$CLI{dbname};host=$$CLI{dbhost}\""
        . " $$CLI{dbuser}"
        . " $$CLI{dbpass}"
        . " '{ quote_char => \"\`\" }'";

    print "... Dumping schema\n$cmd\n";

    my $pid = open3(*CMD_IN, *CMD_OUT, *CMD_ERR, $cmd);

    $SIG{CHLD} = sub {    # need to catch if "dbicdump" dies
        print "REAPER: status $? on $pid\n" if waitpid($pid, 0) > 0;
    };

    close(CMD_IN);        # must close STDIN for client if do not use it

    my $selector = IO::Select->new();    # preparing selector
    $selector->add(*CMD_ERR, *CMD_OUT);  # for non blocking read from the
    my @ready_fh = ();                   # multiple file handles simultaniously

    while (@ready_fh = $selector->can_read) {
        foreach my $fh (@ready_fh) {
            my $data = undef;
            $data = <CMD_ERR> if fileno($fh) == fileno(CMD_ERR);
            $data = <CMD_OUT> if fileno($fh) == fileno(CMD_OUT);
            $selector->remove($fh) if eof($fh);
            if (defined $data) {
                print $data;
                my $match = qr/($$CLI{class} ::Schema::Result::[^\-]+)\-/xs;
                if ($data =~ /$match/) {
                    my $file = $1;
                    my $name = $file;
                    $file =~ s/::/\//g;
                    $name =~ s/.*://g;
                    $$processed{$name} = "$$CLI{dest}/$file.pm";
                }
            }
        }
    }
    close(CMD_OUT);
    close(CMD_ERR);
    return $processed;
}

sub ReadFile {
    my $filename = shift;
    local $/ = undef;
    open(FI, "<", $filename) || confess "Unable to open file, \"$filename\", $!";
    my $filedata = <FI>;
    close(FI);
    return $filedata;
}

sub SaveFile {
    my ($filename, $filedata) = @_;
    local $/ = undef;
    print "  writing \"$filename\"\n";
    open(FO, ">", $filename) || confess "Unable to open file, \"$filename\", $!";
    print FO $filedata;
    close(FO);
}

sub ReadTemplate {
    my $template_name = shift;
    my $toolpath      = abs_path(dirname(abs_path($0)));
    my $tmplt_path    = undef;

    $tmplt_path = "$$CLI{templt}/$template_name"           if -f "$$CLI{templt}/$template_name";
    $tmplt_path = "$toolpath/$$CLI{templt}/$template_name" if -f "$toolpath/$$CLI{templt}/$template_name";

    return defined $tmplt_path && $tmplt_path =~ /\w+/
        ? ReadFile($tmplt_path)
        : confess "Template '$template_name' not found";
}
