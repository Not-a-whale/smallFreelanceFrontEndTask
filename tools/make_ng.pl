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
use threads;
use threads::shared;

use Carp qw( confess longmess);
use Devel::Confess;    # give a stacktrace on any error
use Data::Dumper;
use Try::Tiny;

use PHQ::CLI;          # this is homebrew CLI processor

use Cwd 'abs_path';    # for finding of the relative location of
use File::Basename;    # the templates folder

use IPC::Open3;        # for the asynchronous
use IO::Select;        # execution of dbicdump

use Tie::IxHash;

my %ObjClassTypes : shared;
my %ArrClassTypes : shared;

my $total_start = time();

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

unshift @INC, $$CLI{dest};

my $before_dump = time();
my $dbixpm      = RunDbicDump();
my $after_dump  = time();

confess "No tables processed" unless defined $dbixpm && ref($dbixpm) eq 'HASH' && scalar(%$dbixpm);

UpdateFromTemplate(template => "$$CLI{templt}/Schema.pm", target => "$$CLI{dest}/$$CLI{class}/Schema.pm");

print '-' x 80 . "\n";

my @ResultThreads = ();
foreach (values %$dbixpm) {
    push @ResultThreads,
        threads->create(
        'UpdateFromTemplate',
        template => "$$CLI{templt}/Result.pm",
        target   => $_
        );
}
$_->join() foreach @ResultThreads;

print '-' x 80 . "\n";
require "$$CLI{class}/Schema.pm";

my @ApiThreads = ();
my $before_api = time();
push @ApiThreads, threads->create('BuildAPI', class => $_) foreach sort keys %$dbixpm;
$_->join() foreach @ApiThreads;
my $after_api = time();

unless (exists $$CLI{tables} && defined $$CLI{tables}) {
    print '-' x 80 . "\n";
    my $ObjTypesThread = threads->create('BuildObjectTypes');
    BuildComplexTypes();
    $ObjTypesThread->join;
} else {
    print "\nWARNING: types are not generated due to explicit list of tables!\n\n";
}

print '-' x 80 . "\n";
my $total_end = time();
printf "DBIxDumpe: %d\nAPI Build: %d\nTotal: %d", $after_dump - $before_dump, $after_api - $before_api, $total_end - $total_start;

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

    my $DBIxClass    = $$CLI{class} . '::Schema';
    my $Schema       = $DBIxClass->new();
    my $ResultSet    = $Schema->resultset($args{class});
    my $ResultSource = $ResultSet->result_source;
    my @ColumnsList  = sort $ResultSource->columns;
    my %ColumnsInfo  = map { $_, $ResultSource->column_info($_) } @ColumnsList;
    my %RelateInfo   = map { $_, $ResultSource->relationship_info($_) } $ResultSource->relationships;
    my %PrimaryKeys  = map { $_, 1 } $ResultSource->primary_columns;
    my %UniqueKeys   = $ResultSource->unique_constraints;
    my %required     = ();

    my $has_required = undef;
    my $has_optional = undef;
    my $has_commons  = undef;
    my $has_related  = undef;

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

        'enum'      => 'Any',
        'longblob'  => 'Any',
        'set'       => 'Any',
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

    foreach my $cl (
        grep {defined}
        map {
            (          $ColumnsInfo{$_}{'is_nullable'}
                    || exists $ColumnsInfo{$_}{'is_auto_increment'}
                    || exists $ColumnsInfo{$_}{'default_value'})
                ? undef
                : $_
        }
        sort keys %ColumnsInfo
    ) {
        $required{$cl}++;

        my $isa
            = exists $type_map{$ColumnsInfo{$cl}{data_type}}
            ? $type_map{$ColumnsInfo{$cl}{data_type}}
            : $ColumnsInfo{$cl}{data_type};

        $isa = 'PrimaryKeyInt' if exists $PrimaryKeys{$cl};

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

    foreach my $cl (grep { !exists $required{$_} } @ColumnsList) {
        my $isa
            = exists $type_map{$ColumnsInfo{$cl}{data_type}}
            ? $type_map{$ColumnsInfo{$cl}{data_type}}
            : $ColumnsInfo{$cl}{data_type};

        $isa = 'PrimaryKeyInt' if exists $PrimaryKeys{$cl};

        my $required = $ColumnsInfo{$cl}{'is_nullable'} ? 0 : 1;
        $required = 0 if exists $ColumnsInfo{$cl}{'is_auto_increment'};
        $required = 0
            if exists $ColumnsInfo{$cl}{'default_value'}
            && $ColumnsInfo{$cl}{'default_value'} eq 'CURRENT_TIMESTAMP';

        tie my %attr, 'Tie::IxHash',
            (
            is       => 'rw',
            isa      => $isa,
            coerce   => exists $coerce{$isa} ? $coerce{$isa} : 0,
            required => $required,
            );

        $attr{default} = $ColumnsInfo{$cl}{'default_value'}
            if exists $ColumnsInfo{$cl}{'default_value'}
            && $ColumnsInfo{$cl}{'default_value'} ne 'CURRENT_TIMESTAMP';

        if (exists $attr{default}) {
            push @$has_required, "has '$cl' => (" . join(',', map {"'$_' => '$attr{$_}'"} keys %attr) . ');';
            $attr{required} = 0;
            delete $attr{default};
            push @$has_optional, "has '$cl' => (" . join(',', map {"'$_' => '$attr{$_}'"} keys %attr) . ');';
        } else {
            push @$has_commons, "has '$cl' => (" . join(',', map {"'$_' => '$attr{$_}'"} keys %attr) . ');';
        }
    }

    foreach my $cl (sort keys %RelateInfo) {
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

        push @$has_related, "has '$cl' => (" . join(',', map {"'$_' => '$attr{$_}'"} keys %attr) . ');';
    }

    my $prefetch = join(' ', sort keys %RelateInfo);

    my $basehas = [];

    push @$basehas, @$has_commons if defined $has_commons;
    push @$basehas, ('# relations', @$has_related) if defined $has_related;

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

    $tmplt_path = "$$CLI{templt}/$template_name"
        if -f "$$CLI{templt}/$template_name";
    $tmplt_path = "$toolpath/$$CLI{templt}/$template_name"
        if -f "$toolpath/$$CLI{templt}/$template_name";
    return $tmplt_path =~ /\w+/
        ? ReadFile($tmplt_path)
        : confess "Template '$template_name' not found";
}
