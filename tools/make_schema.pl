#!/usr/bin/perl
# $Id: $

BEGIN {
    unshift @INC, '/usko/web/sites/uskofms/libs';
    unshift @INC, '/usko/office/finance/scripts';
}

use strict;
use warnings FATAL => 'all';
use Carp qw(confess longmess);
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;
use ClassDBI;
use PHQ::CLI;
use JSON;

$Data::Dumper::Terse = 1;

# ----------------------------------------------------------------------------------------------------------------------
# Need to translate DBIx Class to table name and vise versa
my %CLASS_TO_TABLE    = ();       # DBIx class to the real table name
my %TABLE_TO_CLASS    = ();       # real table name to the DBIx class
my %DATA              = ();       # templates and patches from __DATA__ section
my $ObjectTypes       = undef;    # Each wrapper class of DBIx will become a MOOSE type as well
my $ColumnTypes       = {};       # Each Enum/Set column data type will become a MOOSE type as well
my %REGEX_TO_TYPENAME = ();       # Maps similar Enum and Set regex to single type instead of 1 per col per table
my %UNIQUE_TYPENAME   = ();       # Makes sure that the type name used for Enum and Set are unique
my $SMPLTYPE          = undef;    # hash TYPENAME=>COERCE found in CLASS/API/Types/Simple.pl, COERCE is boolean
my $TYPEDATA          = undef;    #
my %FILTERED_ONLY     = ();       # process only specific tables and their dependency

# ----------------------------------------------------------------------------------------------------------------------
my $CLI = ParseCLI(
    isfatal => 1,
    rules   => {
        dbuser => {isa => 'Str', required => 1, default => 'root',         comment => 'Database User'},
        dbpass => {isa => 'Str', required => 1, default => 'Nlvae4asd!',   comment => 'Database Password'},
        dbhost => {isa => 'Str', required => 1, default => '192.168.11.7', comment => 'Database Host or IP'},
        dbname => {isa => 'Str', required => 1, default => 'tms',          comment => 'Database Name'},
        class  => {isa => 'Str', required => 1, default => 'TMS',          comment => 'Name of the perl class'},
        dest   => {isa => 'Str', required => 1, default => 'lib',          comment => 'Library destination folder'},
        prove  => {isa => 'Str', required => 1, default => 't',            comment => 'Test scripts destination'},
        skip_dump => {isa => 'Bool', comment => 'Skip execution of the DBICDUMP'},
        types     => {isa => 'Str',  comment => 'Use predefined types for "HAS" from the JSON file. Run -help for info'},
        tables    => {isa => 'Str',  comment => 'Just process specific tables or classes, comma delimited, use with caution*'},
    }
);

if (defined $$CLI{help}) {
    print <<EOH;
                                   JSON format for types:
                                   {
                                       "people" : {
                                           "FirstName" : "NameCapitalized",
                                           "LastName"  : "NameCapitalized"
                                       }
                                   }

CAUTION:
    Be aware when using '--tables' switch, that object types and column "enum"
    and "set" types are created only for the processed tables.

EOH
    exit 0;
}

# ----------------------------------------------------------------------------------------------------------------------
my $DESTROOT = "$$CLI{dest}/$$CLI{class}";
my $BASEAPI  = "$DESTROOT/API";
my $COREAPI  = "$BASEAPI/Core";
my $TYPESDIR = "$BASEAPI/Types";
my $WEBAPI   = "$BASEAPI/Web";

my $TESTLIBS = "$DESTROOT/Test";
my $TESTCORE = "$TESTLIBS/Core";
my $PROVEDIR = $$CLI{prove} || "$$CLI{dest}/../t";

# ----------------------------------------------------------------------------------------------------------------------
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

# ----------------------------------------------------------------------------------------------------------------------
%FILTERED_ONLY = map { $_, 1 } grep {/\w+/} split(/[\s,]/, $$CLI{tables}) if defined $$CLI{tables};

# ----------------------------------------------------------------------------------------------------------------------
$ENV{DBIC_OVERWRITE_HELPER_METHODS_OK} = 1;

# ----------------------------------------------------------------------------------------------------------------------
# instance of ClassDBI, use DBI to read tables and views detals.
my $h = ClassDBI->new(user => $$CLI{dbuser}, password => $$CLI{dbpass}, host => $$CLI{dbhost}, database => $$CLI{dbname});

# ----------------------------------------------------------------------------------------------------------------------
# patch data and template files are embedded in the script. Multiple files are stored using a 'two-lines' delimeter
#       # ------------------------------
#       file-delimiter: <tag>
my $embedded_data = '';
foreach (<DATA>) {
    s/CLASS::/$$CLI{class}\:\:/g;
    $embedded_data .= $_;
}

# convert bigdata into hash of 'tag' => 'file content'
%DATA = grep(/\w+/, split(/\s+\#\s\-+\s+file-delimiter:\s+(\S+)\s+/s, $embedded_data));

# ----------------------------------------------------------------------------------------------------------------------
# Directory for the MOOSE high level API classes
print "... Preparing $COREAPI, $WEBAPI, $TYPESDIR, $TESTCORE, $PROVEDIR\n";
`mkdir -p "$COREAPI"`;     # just use UNIX. :(
`mkdir -p "$WEBAPI"`;      # just use UNIX. :(
`mkdir -p "$TYPESDIR"`;    # just use UNIX. :(
`mkdir -p "$TESTCORE"`;    # just use UNIX. :(
`mkdir -p "$PROVEDIR"`;    # just use UNIX. :(

# ----------------------------------------------------------------------------------------------------------------------
# build DBIx using dbicdump with MOOSE flags
unless (defined $$CLI{skip_dump}) {
    my $cmd
        = "dbicdump"
        . " -o preserve_case=1"
        . " -o dump_directory=$$CLI{dest}"
        . " -o use_moose=1"
        . " $$CLI{class}::Schema"
        . " \"dbi:mysql:database=$$CLI{dbname};host=$$CLI{dbhost}\""
        . " $$CLI{dbuser}"
        . " $$CLI{dbpass}"
        . " '{ quote_char => \"\`\" }'";

    print "... Dumping schema\n$cmd\n";
    print `$cmd`;

    # ----------------------------------------------------------------------------------------------------------------------
    # Modify Schema.pm created by dbicdump. Add
    print "... Fixing Schema.pm\n";
    my $schema_pm_text = `cat $$CLI{dest}/$$CLI{class}/Schema.pm`;
    $schema_pm_text =~ s/(# DO NOT MODIFY THIS OR ANYTHING[^\n]+).*/$1\n$DATA{'Schema.pm'}/s;
    open(FO, ">$$CLI{dest}/$$CLI{class}/Schema.pm");
    print FO $schema_pm_text;
    close(FO);
}

# ----------------------------------------------------------------------------------------------------------------------
# find where the Result folder is.
my $result_dir = `find $$CLI{dest}/$$CLI{class} -follow -type d -name Result`;    # using UNIX again.
$result_dir =~ s/\s+$//;                                                          # we used UNIX, so must clean up spaces.

# ----------------------------------------------------------------------------------------------------------------------
# go through each individual DBIx class file and modify it according to our embedded data 'result_set_suffix'
my @result_files = split(/\n/, `find "$result_dir" -follow -type f -name "*.pm"`);
foreach my $result_file (@result_files) {

    # ------------------------------------------------------------------------------------------------------------------
    my ($table, $base) = (undef, undef);    # table name and the base name of the class without '::'
    $table = `grep -- '__PACKAGE__->table' $result_file`;    # fetch table name using UNIX again
    $table =~ s/.*table\(\"//s;                              # clean up a bit
    $table =~ s/".*//s;

    $base = $result_file;                                    # DBIx file becomes a class name
    $base =~ s/.*\///g;                                      # without any prefix.
    $base =~ s/\.pm$//;                                      # or suffix

    $CLASS_TO_TABLE{$base}  = $table;                        # now we have a table and the class
    $TABLE_TO_CLASS{$table} = $base;                         # so populate the mapping hash

    # ------------------------------------------------------------------------------------------------------------------
    # patch each DBIx class file using data from __DATA__ identified by tag 'result_set_suffix'
    print "... Fixing $result_file\n";
    my $result_text = `cat $result_file`;    # read file using UNIX (again)

    $result_text =~ s/(# You can replace this text[^\n]+).*/$1\n\n$DATA{result_set_suffix}/s;
    open(FO, ">$result_file");
    print FO $result_text;
    close(FO);
}

# ----------------------------------------------------------------------------------------------------------------------
my $json_map = "$$CLI{dest}/$$CLI{class}/TablesVsClasses.json";
if (open(FO, ">$json_map")) {
    print "... $json_map\n";
    my $json = JSON->new->indent->space_after->space_before->encode(
        {   TableToClass => \%TABLE_TO_CLASS,
            ClassToTable => \%CLASS_TO_TABLE
        }
    );
    print FO "$json\n";
    close(FO);
}

# ----------------------------------------------------------------------------------------------------------------------
# Building MOOSE API high level classes
foreach my $base (sort keys %CLASS_TO_TABLE) {
    my $coreapi
        = -f "$COREAPI/$base.pm"
        ? `cat $COREAPI/$base.pm`
        : $DATA{CLASS_HEADER};    # pull CLASS WRAPPER template for the MOOSE API file

    my $table      = $CLASS_TO_TABLE{$base};    # use shorter variable table instead of $DATA{CLASS_HEADER}
    my $table_info = undef;                     # complete table info, columns, comments, types, etc
    my $fks        = undef;                     # foreign keys hash ref extracted from $table_info

    next if scalar(%FILTERED_ONLY) && !(exists $FILTERED_ONLY{$base} || exists $FILTERED_ONLY{$table});

    # get full table info - see ClassDBI.pm. Be aware of old DBIx classes and missing tables, hence the try/catch
    my $skip_base = undef;                      # flag if we have missing table, has to be defined outside the 'try/catch'
    try {
        $table_info = $h->full_table_info(table => $table);    # see ClassDBI.pm
    } catch {
        if (/(No table info for[^\n]+)/si) {                   # show info about possible removal for missing tables
            print "\n$1\n"
                . "  git rm $result_dir/$base.pm\n"
                . "  git commit -m \"removed $result_dir/$base.pm\"\n"
                . "  git rm $COREAPI/$base.pm\n"
                . "  git commit -m \"removed $COREAPI/$base.pm\"\n"
                . "  rm $result_dir/$base.pm $COREAPI/$base.pm\n\n";

            $skip_base++;
        }
    };
    next if $skip_base;    # cannot run 'next' from within 'try/catch' since it's really a fancy declaration of the function

    print "$base - $table\n";

    #-------------------------------------------------------------------------------------------------------------------
    my $TheCoreClass = "$$CLI{class}::API::Core::$base";
    print "... Building $TheCoreClass\n";
    my $testdefaults = undef;
    $coreapi =~ s/package $$CLI{class}::API::Core::;/package $$CLI{class}::API::Core::$base;/s
        ;                  # add the proper class name to the package

    %$fks = map { $$_{'COLUMN_NAME'}, $_ }
        grep { defined $$_{'REFERENCED_TABLE_NAME'} && defined $$_{'REFERENCED_COLUMN_NAME'} } @{$$table_info{'constraints'}}
        if ref($$table_info{'constraints'}) eq 'ARRAY';

    if ($fks) {
        my $dependency = "";
        my %fk_classes = map { $TABLE_TO_CLASS{$$fks{$_}{'REFERENCED_TABLE_NAME'}}, 1 } keys %$fks;
        foreach (keys %fk_classes) {
            my $TheDepClass = "$$CLI{class}::API::Core::$_";
            next if $TheCoreClass eq $TheDepClass;                  # required for trees;
            $dependency .= "use $$CLI{class}::API::Core::$_;\n";
            $$ObjectTypes{$_ . 'Obj'}{name}  = "$$CLI{class}::API::Core::$_";
            $$ObjectTypes{$_ . 'Obj'}{table} = $h->full_table_info(table => $CLASS_TO_TABLE{$_});
        }
        $coreapi =~ s/(# AUTO-GENERATED DEPENDENCIES START).*?(# AUTO-GENERATED DEPENDENCIES END)/$1\n$dependency\n$2\n/s;
    }
    $coreapi .= "\n\n";

    my $has_content = "";

    foreach my $cl (@{$$table_info{'columns'}}) {
        my $coerce = 1;
        my $isa    = uc($$cl{'COLUMN_TYPE'});
        $isa =~ s/\(.*//;

        if ($$CLI{types} && exists $$TYPEDATA{$table}{$$cl{'COLUMN_NAME'}}) {
            confess "Requested type \"$$TYPEDATA{$table}{$$cl{'COLUMN_NAME'}}\" does not exist"
                if !exists $$SMPLTYPE{$$TYPEDATA{$table}{$$cl{'COLUMN_NAME'}}};
            $isa    = $$TYPEDATA{$table}{$$cl{'COLUMN_NAME'}};
            $coerce = $$SMPLTYPE{$$TYPEDATA{$table}{$$cl{'COLUMN_NAME'}}};
        } else {
            $isa = 'TidySpacesString' if $isa =~ /(CHAR|TEXT)/;
            $isa = 'BoolInt'          if $isa =~ /TINYINT/;
            $isa = 'Int'              if $isa =~ /INT/;
            $isa = 'Float'            if $isa =~ /DOUBLE|FLOAT|DECIMAL/;

            $isa = check_enum_type($isa, $cl, $ColumnTypes) || $isa;
            $isa = check_set_type($isa, $cl, $ColumnTypes) || $isa;

            $coerce = 0 if $isa =~ /^Int$/;
        }

        $$testdefaults{$$cl{'COLUMN_NAME'}} = ' ';
        if ($$cl{'COLUMN_KEY'} eq 'PRI') {
            $isa                                = 'PrimaryKeyInt';
            $$testdefaults{$$cl{'COLUMN_NAME'}} = undef;
            $coerce                             = 0;
        }

        if (defined $fks && exists $$fks{$$cl{'COLUMN_NAME'}}) {
            $isa = $TABLE_TO_CLASS{$$fks{$$cl{'COLUMN_NAME'}}{'REFERENCED_TABLE_NAME'}} . 'Obj' . ' | Int ';
            if ($$fks{$$cl{'COLUMN_NAME'}}{'REFERENCED_TABLE_NAME'} eq $table) {
                $$testdefaults{$$cl{'COLUMN_NAME'}} = undef;
            } else {
                $coerce = 1;
            }
        }

        my $required = $$cl{'REQUIRED'} ? 1 : 0;
        my $has      = $DATA{has_a_statement};

        $has =~ s/COLNAME/$$cl{'COLUMN_NAME'}/s;
        $has =~ s/TYPE/$isa/s;
        $has =~ s/REQUIRED/$required/s;
        $has =~ s/coerce => \d+/coerce => $coerce/s;

        $has_content .= $has;
    }

    $coreapi =~ s/(# AUTO-GENERATED HAS-A START).*?(# AUTO-GENERATED HAS-A END)/$1\n$has_content\n$2\n/s;
    $coreapi =~ s/\s+1;\s+1;\s*$/\n1;/g;
    save_n_tidy("$COREAPI/$base.pm", $coreapi);

    #-------------------------------------------------------------------------------------------------------------------
    {
        my $filename = "$TESTCORE/$base.pm";
        my $template = $DATA{CLASS_TEST};

        print "... Building $$CLI{class}::Test::Core::$base\n";

        $template =~ s/CLASS/$$CLI{class}/gs;
        $template =~ s/Core::/Core::$base/gs;
        save_n_tidy($filename, $template);
    }

    #-------------------------------------------------------------------------------------------------------------------
    {
        my $filename = "001_$base.CoreSchema.t";
        my $template = $DATA{TEST_CORE_SCHEMA};

        print "... Building t/$filename\n";

        $template =~ s/CLASS/$$CLI{class}/gs;
        $template =~ s/Core::/Core::$base/gs;

        my $attributedefaults = Dumper($testdefaults);
        $template =~ s/TESTDEFAULTS/$attributedefaults/s;
        save_n_tidy("$PROVEDIR/$filename", $template);
    }

    #-------------------------------------------------------------------------------------------------------------------
    {
        my $filename = "001_$base.CoreDataManip.t";
        my $template = $DATA{TEST_CORE_DATAMANIP};

        print "... Building t/$filename\n";

        $template =~ s/CLASS/$$CLI{class}/gs;
        $template =~ s/Core::/Core::$base/gs;

        my $attributedefaults = Dumper($testdefaults);
        $template =~ s/TESTDEFAULTS/$attributedefaults/s;
        save_n_tidy("$PROVEDIR/$filename", $template);
    }
}

# ----------------------------------------------------------------------------------------------------------------------
{
    print "... Saving Column Types\n";
    my $column_types = "";
    foreach my $type (keys %$ColumnTypes) {
        print "     $type\n";
        my $col  = $$ColumnTypes{$type};
        my $text = '';
        if ($$col{DATA_TYPE} eq 'enum') {
            $text = enum_type($type, $col);
        } elsif ($$col{DATA_TYPE} eq 'set') {
            $text = set_type($type, $col);
        }

        $column_types .= $text;
    }

    my $column_types_filename = "$TYPESDIR/Columns.pm";

    #Save the column types contents into an already existing file, or use the template
    # $DATA{ColumnTypes} =~ s/package CLASS::/package $$CLI{class}\:\:/s;
    my $column_types_content = -f $column_types_filename ? `cat $column_types_filename` : $DATA{ColumnTypes};
    $column_types_content =~ s/(#AUTO-GENERATED).*(#AUTO-GENERATED)/$1\n$column_types\n$2/s;
    save_n_tidy($column_types_filename, $column_types_content);
}

# ----------------------------------------------------------------------------------------------------------------------
{
    print "... Saving Object Types\n";
    foreach my $type (keys %$ObjectTypes) {
        my $class   = $$ObjectTypes{$type}{name};
        my $ctest   = $class;
        my $otype   = $DATA{ObjectType};
        my $attrs   = undef;
        my $aschr   = undef;
        my %prikeys = map { $$_{COLUMN_NAME}, 1 }
            grep { $$_{CONSTRAINT_TYPE} eq 'PRIMARY KEY' } @{$$ObjectTypes{$type}{table}{constraints}};

        foreach my $cl (@{$$ObjectTypes{$type}{table}{columns}}) {
            $$attrs{$$cl{COLUMN_NAME}} = exists $prikeys{$$cl{COLUMN_NAME}} ? undef : ' ';
        }
        $aschr = Dumper($attrs);

        $ctest =~ s/API::Core/Test::Core/;

        print "     $class\n";
        $otype =~ s/TYPENAME/$type/gs;
        $otype =~ s/CLASSNAME/$class/gs;
        $otype =~ s/TESTCLASS/$ctest/gs;
        $otype =~ s/TESTDEFAULTS/$aschr/gs;

        $DATA{ObjectTypes} .= "\n$otype\n";
    }
    $DATA{ObjectTypes} .= "\n1;\n";
    save_n_tidy("$TYPESDIR/Objects.pm", $DATA{ObjectTypes});
}

# ----------------------------------------------------------------------------------------------------------------------
sub save_n_tidy {
    my ($file, $data) = @_;
    open(FO, ">$file");
    print FO "$data\n";
    close(FO);
    `/usr/local/bin/perltidy "$file"`;
    `mv "$file.tdy" "$file"`;
}

sub enum_type {
    my ($type, $col) = @_;
    my $text = $DATA{ENUM};
    my $opts = join(',', map { "'" . lc($_) . "' => 1" } @{$$col{'ENUM_VALUES'}});
    my $list = join(',', map { "'" . lc($_) . "'" } @{$$col{'ENUM_VALUES'}});

    $text =~ s/EnumTYPENAME/$type/gs;
    $text =~ s/OPTIONS/$opts/gs;
    $text =~ s/LISTS/$list/gs;
    return "$text\n";
}

sub set_type {
    my ($type, $col) = @_;
    my $text = $DATA{SET};
    my $opts = join(',', map { "'" . lc($_) . "' => 1" } @{$$col{'ENUM_VALUES'}});
    my $list = join(',', map { "'" . lc($_) . "'" } @{$$col{'ENUM_VALUES'}});
    $text =~ s/EnumTYPENAME/$type/gs;
    $text =~ s/OPTIONS/$opts/gs;
    $text =~ s/LISTS/$list/gs;
    return "$text\n";
}

sub check_col_type {
    my ($isa, $col, $typeshash, $regex) = @_;
    my $typename;
    $isa =~ s/(\w)(\w+)/\u$1\L$2/;

    if (exists $REGEX_TO_TYPENAME{$regex} and defined $REGEX_TO_TYPENAME{$regex}) {
        if (not exists $$typeshash{$REGEX_TO_TYPENAME{$regex}}) {
            $$typeshash{$REGEX_TO_TYPENAME{$regex}} = $col;
        }
        $typename = $REGEX_TO_TYPENAME{$regex};
    } else {

        # check to see if potential name of type exists already
        my $success = undef;

        foreach (@{$$col{'ENUM_VALUES'}}) {
            (my $val = $_) =~ s/(\w)(\w+)\s*/\u$1\L$2/gs;

            $typename = $isa . $val;
            if (exists $UNIQUE_TYPENAME{$typename}) {
                $typename = undef;
                next;
            }
            $REGEX_TO_TYPENAME{$regex}  = $typename;
            $UNIQUE_TYPENAME{$typename} = 1;
            $$typeshash{$typename}      = $col;
            $success                    = 1;
            print "...... Creating $typename Type\n";
            last;
        }
    }
    return $typename;
}

sub check_enum_type {
    my ($isa, $col, $typeshash) = @_;
    if ($isa eq 'ENUM') {
        my $regex = join('|', map {"^$_\$"} @{$$col{'ENUM_VALUES'}});
        $regex .= '|^$' if $$col{IS_NULLABLE} eq 'YES';
        $regex = qr/$regex/;
        $$col{REGEX} = $regex;
        return check_col_type($isa, $col, $typeshash, $regex);
    }
    return undef;
}

sub check_set_type {
    my ($isa, $col, $ColumnTypes) = @_;
    if ($isa eq 'SET') {
        my $regex = '\'' . join(',', @{$$col{'ENUM_VALUES'}}) . '\'';
        $$col{REGEX} = $regex;
        return check_col_type($isa, $col, $ColumnTypes, $regex);
    }
    return undef;
}

__DATA__

# ----------------------------------------------------------------------------------------------------------------------
file-delimiter: Schema.pm

has dbhost => (is => 'ro', isa => 'Str', required => 1, default => '192.168.11.7');
has dbport => (is => 'ro', isa => 'Int', required => 1, default => 3306);
has dbuser => (is => 'ro', isa => 'Str', required => 1, default => 'root');
has dbpass => (is => 'ro', isa => 'Str', required => 1, default => 'Nlvae4asd!');
has dbname => (is => 'ro', isa => 'Str', required => 1, default => 'tms');
has dbsock => (is => 'ro', isa => 'Str', required => 1, default => '/dbrelated/mysql.sock');
has extras => (is => 'rw', isa => 'HashRef', required => 0);

has DBIxHandle => (is => 'rw', lazy => 1, builder => '_connect_to_db');

sub _connect_to_db {
    my $self = shift;
    my $dsnx = 'DBI:mysql:database=' . $self->dbname . ';';
    $dsnx .=
        $self->dbhost eq 'localhost'
        ? 'mysql_socket=' . $self->dbsock
        : 'host=' . $self->dbhost . ';port=' . $self->dbport;
    $dsnx .= ';';

    my $extras
        = scalar($self->extras)
        ? $self->extras
        : {mysql_auto_reconnect => 1, mysql_server_prepare => 1, RaiseError => 1, AutoCommit => 1};
    $self->extras($extras);    # make it visible from outside.
    $ENV{DBIC_UNSAFE_AUTOCOMMIT_OK} = 1 unless $$extras{AutoCommit};
    my $schema = $self->connect($dsnx, $self->dbuser, $self->dbpass, $extras);
    $self->DBIxHandle($schema);
}

__PACKAGE__->meta->make_immutable(inline_constructor => 1);
1;

# ----------------------------------------------------------------------------------------------------------------------
file-delimiter: result_set_suffix

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;

# ----------------------------------------------------------------------------------------------------------------------
file-delimiter: ENUM
# ............................................................................
subtype 'EnumTYPENAME',
    as 'Str',
        where {
            my %options = ( OPTIONS );
            return exists $options{$_};
        };

coerce 'EnumTYPENAME',
    from 'Str',
        via {
            if( $AUTO_GENERATE ) {
                my @list = ( LISTS );
                return rand_enum(set => \@list);
            } else {
                s/(^\s+|\s+$)//g;
                s/\s+/ /g;
                return( lc($_) );
            }
        };


# ----------------------------------------------------------------------------------------------------------------------
file-delimiter: SET
# ............................................................................
subtype 'EnumTYPENAME',
    as 'Str',
        where {
            my %options = ( OPTIONS );
            return scalar ( grep { not exists $options{$_} } split(/,/, $_)) == 0;
        };

coerce 'EnumTYPENAME',
    from 'Str',
        via {
            if( $AUTO_GENERATE ) {
                my @list = ( LISTS );
                return join(',', rand_set(set => \@list, min => 1, max => scalar(@list), shuffle => 1));
            } else {
                join(',', map{ s/(^\s+|\s+$)//g; s/\s+/ /g; lc($_) } split(',',$_));
            }
        };

# ----------------------------------------------------------------------------------------------------------------------
file-delimiter: CLASS_HEADER

package CLASS::API::Core::;

# $Id: $
use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use Moose;
# AUTO-GENERATED DEPENDENCIES START
# AUTO-GENERATED DEPENDENCIES END

use CLASS::SchemaWrapper;
use CLASS::API::Types::Simple;
use CLASS::API::Types::Objects;
use CLASS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'CLASS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
# AUTO-GENERATED HAS-A END

1;

# ----------------------------------------------------------------------------------------------------------------------
file-delimiter: CLASS_TEST

package CLASS::Test::Core::;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use Moose;
use MooseX::Types::Moose qw(Undef);

extends 'CLASS::API::Core::';
with 'TMS::Test::DataGen';
with 'TMS::Test::Cases::SchemaWrapper';
with 'TMS::Test::Cases::BasicDataManip';
with 'TMS::Test::Suites::SchemaWrapper';
with 'TMS::Test::Suites::BasicDataManip';

# override types here
# has '+COLNAME' => (is => 'rw', coerce => 1, required => REQUIRED, isa => Undef | 'TYPE',);
# has '+COLNAME' => (init_arg => undef, builder => '_build_undef' );
# sub _build_undef { shift->COLNAME(undef) };


1;

# ----------------------------------------------------------------------------------------------------------------------
file-delimiter: TEST_CORE_SCHEMA

BEGIN {
    use Cwd 'abs_path';
    use File::Basename;
    unshift @INC, abs_path(dirname(abs_path($0)) . '/../lib');
}

use strict;
use warnings FATAL => 'all';
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;
use Test::More;

use CLASS::API::Types::Columns;
use CLASS::API::Types::Simple;
use CLASS::API::Types::Objects;
use CLASS::Test::Core::;

$CLASS::API::Types::Columns::AUTO_GENERATE=1;
$CLASS::API::Types::Simple::AUTO_GENERATE=1;
$CLASS::API::Types::Objects::AUTO_GENERATE=1;

my $TheDefault = TESTDEFAULTS;

my $Obj = CLASS::Test::Core::->new(%$TheDefault);
$Obj->SchemaWrapperAll;
done_testing();

# ----------------------------------------------------------------------------------------------------------------------
file-delimiter: TEST_CORE_DATAMANIP

BEGIN {
    use Cwd 'abs_path';
    use File::Basename;
    unshift @INC, abs_path(dirname(abs_path($0)) . '/../lib');
}

use strict;
use warnings FATAL => 'all';
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;
use Test::More;

use CLASS::API::Types::Columns;
use CLASS::API::Types::Simple;
use CLASS::API::Types::Objects;
use CLASS::Test::Core::;

$CLASS::API::Types::Columns::AUTO_GENERATE=1;
$CLASS::API::Types::Simple::AUTO_GENERATE=1;
$CLASS::API::Types::Objects::AUTO_GENERATE=1;

my $TheDefault = TESTDEFAULTS;

my $Obj = CLASS::Test::Core::->new(%$TheDefault);
$Obj->BasicDataManipAll;
done_testing();

# ----------------------------------------------------------------------------------------------------------------------
file-delimiter: ObjectTypes
package CLASS::API::Types::Objects;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Date::Manip;

use Moose::Util::TypeConstraints;

our $AUTO_GENERATE=0;


# ----------------------------------------------------------------------------------------------------------------------
file-delimiter: ObjectType

# ............................................................................
subtype 'TYPENAME',
    as class_type('CLASSNAME');
coerce 'TYPENAME',
    from 'HashRef',
        via {
            if ($AUTO_GENERATE) {
                my $TheDefault = TESTDEFAULTS;
                return TESTCLASS->new(%$TheDefault);
            }
            return CLASSNAME->new(%{$_});
        },
    from 'Str',
        via {
            if ($AUTO_GENERATE) {
                my $TheDefault = TESTDEFAULTS;
                return TESTCLASS->new(%$TheDefault);
            }
            return $_;
        };


# ----------------------------------------------------------------------------------------------------------------------
file-delimiter: has_a_statement

has COLNAME => (is => 'rw', coerce => 1, required => REQUIRED, isa => Undef | 'TYPE',);


# ----------------------------------------------------------------------------------------------------------------------
file-delimiter: ColumnTypes
package CLASS::API::Types::Columns;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Date::Manip;
use Data::Random qw(:all);

use Moose::Util::TypeConstraints;

our $AUTO_GENERATE=0;

#AUTO-GENERATED

#AUTO-GENERATED

1;

# ----------------------------------------------------------------------------------------------------------------------
file-delimiter: CLASS_HEADER_CLI
#!/usr/bin/perl
package CLASS::CLI::;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Date::Manip;
use PHQ::CLI;

BEGIN {
    unshift @INC, '/usko/web/sites/uskofms/libs';
    unshift @INC, '/usko/office/finance/scripts';
}

#AUTO-GENERATED

#AUTO-GENERATED

1;
