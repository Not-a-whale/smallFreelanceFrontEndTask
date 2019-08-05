#!/usr/bin/perl
# $Id: $

BEGIN {
    unshift @INC, '/usko/web/sites/uskofms/libs';
    unshift @INC, '/usko/office/finance/scripts';
}

use strict;
use warnings FATAL => 'all';
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;
use ClassDBI;
use PHQ::CLI;
use Carp;
use JSON;

# ----------------------------------------------------------------------------------------------------------------------
# Need to translate DBIx Class to table name and vise versa
my %CLASS_TO_TABLE    = ();       # DBIx class to the real table name
my %TABLE_TO_CLASS    = ();       # real table name to the DBIx class
my %DATA              = ();       # templates and patches from __DATA__ section
my $ObjectTypes       = undef;    # Each wrapper class of DBIx will become a MOOSE type as well
my $ColumnTypes       = {};       # Each Enum/Set column data type will become a MOOSE type as well
my %REGEX_TO_TYPENAME = ();       # Maps similar Enum and Set regex to single type instead of 1 per col per table
my %UNIQUE_TYPENAME   = ();       # Makes sure that the type name used for Enum and Set are unique

# ----------------------------------------------------------------------------------------------------------------------
my $CLI = ParseCLI(
    isfatal => 1,
    rules   => {
        dbuser    => {isa => 'Str', required => 1, default => 'root'},
        dbpass    => {isa => 'Str', required => 1, default => 'Nlvae4asd!'},
        dbhost    => {isa => 'Str', required => 1, default => '192.168.11.7'},
        dbname    => {isa => 'Str', required => 1, default => 'tms'},
        class     => {isa => 'Str', required => 1, default => 'TMS'},
        dest      => {isa => 'Str', required => 1, default => 'lib'},
        skip_dump => {isa => 'Bool',},
    }
);

# ----------------------------------------------------------------------------------------------------------------------
my $DESTROOT = "$$CLI{dest}/$$CLI{class}";
my $BASEAPI  = "$DESTROOT/API";
my $COREAPI  = "$BASEAPI/Core";
my $TYPESDIR = "$BASEAPI/Types";
my $WEBAPI   = "$BASEAPI/Web";

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
    $embedded_data .= $_
}

# convert bigdata into hash of 'tag' => 'file content'
%DATA = grep(/\w+/, split(/\s+\#\s\-+\s+file-delimiter:\s+(\S+)\s+/s, $embedded_data));

# ----------------------------------------------------------------------------------------------------------------------
# Directory for the MOOSE high level API classes
print "... Preparing $COREAPI, $WEBAPI, $TYPESDIR\n";
`mkdir -p "$COREAPI"`;    # just use UNIX. :(
`mkdir -p "$WEBAPI"`;    # just use UNIX. :(
`mkdir -p "$TYPESDIR"`;    # just use UNIX. :(

# ----------------------------------------------------------------------------------------------------------------------
# build DBIx using dbicdump with MOOSE flags
unless (defined $$CLI{skip_dump}) {
    print "... Dumping schema\n";
    print
        "dbicdump -o preserve_case=1 -o dump_directory=$$CLI{dest} -o use_moose=1 $$CLI{class}::Schema \"dbi:mysql:database=$$CLI{dbname};host=$$CLI{dbhost}\" $$CLI{dbuser} $$CLI{dbpass} '{ quote_char => \"\`\" }'\n";
    `dbicdump -o preserve_case=1 -o dump_directory=$$CLI{dest} -o use_moose=1 $$CLI{class}::Schema "dbi:mysql:database=$$CLI{dbname};host=$$CLI{dbhost}" $$CLI{dbuser} $$CLI{dbpass} '{ quote_char => \"\`\" }'`;

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
# add Schema Wrapper is a static file, a wrapper around native DBIx Schema.pm
if (not -f "$$CLI{dest}/$$CLI{class}/SchemaWrapper.pm") {
    print "... Building: $$CLI{class}/SchemaWrapper.pm\n";
    open(FO, ">$$CLI{dest}/$$CLI{class}/SchemaWrapper.pm");
    print FO $DATA{'SchemaWrapper.pm'};    # embedded SchemaWrapper.pm - use the file as is
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
foreach my $base (keys %CLASS_TO_TABLE) {
    my $content
        = -f "$COREAPI/$base.pm" ? `cat $COREAPI/$base.pm` : $DATA{CLASS_HEADER}; # pull CLASS WRAPPER template for the MOOSE API file
    my $table      = $CLASS_TO_TABLE{$base};    # use shorter variable table instead of $DATA{CLASS_HEADER}
    my $table_info = undef;                     # complete table info, columns, comments, types, etc
    my $fks        = undef;                     # foreign keys hash ref extracted from $table_info

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

            # print "$1\n (git rm $result_dir/$base.pm\n git rm $COREAPI/$base.pm )\n";
            $skip_base++;
        }
    };
    next if $skip_base;    # cannot run 'next' from within 'try/catch' since it's really a fancy declaration of the function

#    $content =~ s/package CLASS::API::Core::/package $$CLI{class}::API::Core::$base/s;    # add the proper class name to the package
    $content =~ s/package $$CLI{class}::API::Core::;/package $$CLI{class}::API::Core::$base;/s; # add the proper class name to the package
    print "... Building $$CLI{class}::API::Core::$base\n";

    %$fks = map { $$_{'COLUMN_NAME'}, $_ }
        grep { defined $$_{'REFERENCED_TABLE_NAME'} && defined $$_{'REFERENCED_COLUMN_NAME'} } @{$$table_info{'constraints'}}
        if ref($$table_info{'constraints'}) eq 'ARRAY';

    #Build the CLI file that is used for testing purposes.
    #build_cli($table, $table_info, $fks, $base);

    if ($fks) {
        my $dependency = "";
        my %fk_classes = map { $TABLE_TO_CLASS{$$fks{$_}{'REFERENCED_TABLE_NAME'}}, 1 } keys %$fks;
        foreach (keys %fk_classes) {
            $dependency .= "use $$CLI{class}::API::Core::$_;\n";
            $$ObjectTypes{$_ . 'Obj'} = "$$CLI{class}::API::Core::$_";
        }
        $content =~ s/(# AUTO-GENERATED DEPENDENCIES START).*?(# AUTO-GENERATED DEPENDENCIES END)/$1\n$dependency\n$2\n/s;
    }
    $content .= "\n\n";

    my $has_content = "";
    foreach my $cl (@{$$table_info{'columns'}}) {
        my $isa = uc($$cl{'COLUMN_TYPE'});
        $isa =~ s/\(.*//;

        $isa = 'Str'   if $isa =~ /(CHAR|TEXT)/;
        $isa = 'Bool'  if $isa =~ /TINYINT/;
        $isa = 'Int'   if $isa =~ /INT/;
        $isa = 'Float' if $isa =~ /DOUBLE|FLOAT|DECIMAL/;

        $isa = check_enum_type($isa, $cl, $ColumnTypes) || $isa;
        $isa = check_set_type($isa, $cl, $ColumnTypes) || $isa;

        $isa = 'PrimaryKeyInt' if $$cl{'COLUMN_KEY'} eq 'PRI';
        $isa = $TABLE_TO_CLASS{$$fks{$$cl{'COLUMN_NAME'}}{'REFERENCED_TABLE_NAME'}} . 'Obj'
            if defined $fks && exists $$fks{$$cl{'COLUMN_NAME'}};

        my $required = $$cl{'REQUIRED'} ? 1 : 0;
        my $has      = $DATA{has_a_statement};
        $has =~ s/COLNAME/$$cl{'COLUMN_NAME'}/s;
        $has =~ s/TYPE/$isa/s;
        $has =~ s/REQUIRED/$required/s;
        $has =~ s/coerce => 1/coerce => 0/ if $isa =~ /^(Str|Bool|Int)$|^(Enum|Set)/;

        $has_content .= $has;
    }

    $content =~ s/(# AUTO-GENERATED HAS-A START).*?(# AUTO-GENERATED HAS-A END)/$1\n$has_content\n$2\n/s;
    $content =~ s/\s+1;\s+1;\s*$/\n1;/g;

    open(FO, ">", "$COREAPI/$base.pm");
    print FO "$content\n";
    close(FO);
    `/usr/local/bin/perltidy $COREAPI/$base.pm`;
    `mv $COREAPI/$base.pm.tdy $COREAPI/$base.pm`;
}

# ............................................................................
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
open(FO, ">$column_types_filename");
print FO $column_types_content;
close(FO);

sub enum_type {
    my ($type, $col) = @_;

    # Generate the regex from the values,
    my $regex   = $$col{REGEX};
    my $default = $$col{'COLUMN_DEFAULT'};
    my $text    = <<EOENUM;
# ............................................................................
subtype '$type',
    as 'Str',
        where { m{$regex}; };
EOENUM
    return $text;
} ## end sub enum_type

sub set_type {
    my ($type, $col) = @_;

    # Generate the regex from the values,

    my $setvals  = $$col{REGEX};
    my $default  = $$col{'COLUMN_DEFAULT'};
    my $nullable = $$col{'IS_NULLABLE'} eq 'YES' ? 'return 1 if not defined $_ || $_ eq \'\';' : '';
    my $text     = <<EOSET;
# ............................................................................
subtype '$type',
    as 'Str',
        where {
                $nullable
                my \%vals = map {\$_ => 1} split( /,/, $setvals );
                return scalar ( grep { not exists \$vals{\$_} } split(/,/, \$_)) == 0;
            };
EOSET
    if ($default) {
        $text .= <<EOSET_DEF;
coerce '$type',
    from 'Str',
        via {
                my \%vals = map {\$_ => 1} split( ',', $setvals );
                return join(',', do{ my \%u; grep { exists \$vals{\$_} } grep { !\$u{\$_}++ } split(',', \$_)});
            };
EOSET_DEF
    }

    return $text;
} ## end sub set_type

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
        foreach my $val (@{$$col{'ENUM_VALUES'}}) {
            $val =~ s/(\w)(\w+)\s*/\u$1\L$2/gs;
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
} ## end sub check_col_type

sub check_enum_type {
    my ($isa, $col, $typeshash) = @_;
    if ($isa =~ /^ENUM$/) {
        my $regex = join('|', map {"^$_\$"} @{$$col{'ENUM_VALUES'}});
        $regex .= '|^$' if $$col{IS_NULLABLE} eq 'YES';
        $regex = qr/$regex/;
        $$col{REGEX} = $regex;
        return check_col_type($isa, $col, $typeshash, $regex);
    }
    return undef;
} ## end sub check_enum_type

sub check_set_type {
    my ($isa, $col, $ColumnTypes) = @_;
    if ($isa =~ /^SET$/) {
        my $regex = '\'' . join(',', @{$$col{'ENUM_VALUES'}}) . '\'';
        $$col{REGEX} = $regex;
        return check_col_type($isa, $col, $ColumnTypes, $regex);
    }
    return undef;
} ## end sub check_set_type

# ............................................................................
print "... Saving Object Types\n";
foreach my $type (keys %$ObjectTypes) {
    my $class = $$ObjectTypes{$type};
    print "     $class\n";
    my $text = <<EOTYPE;

# ............................................................................
subtype '$type',
    as class_type('$class');
coerce '$type',
    from 'HashRef',
        via { $class\->new(\%{\$_}) };
EOTYPE
    $DATA{ObjectTypes} .= $text;
}
$DATA{ObjectTypes} .= "\n1;\n";
# $DATA{ObjectTypes} =~ s/package CLASS::/package $$CLI{class}\:\:/s;
open(FO, ">$TYPESDIR/Objects.pm");
print FO $DATA{ObjectTypes};
close(FO);

# ----------------------------------------------------------------------------------------------------------------------
sub build_cli {
    my ($table, $table_info, $foreign_keys, $base) = @_;
    my $content       = $DATA{CLASS_HEADER_CLI};
    my $rule_default  = 'default => \'VALUE\',';    #used to construct the default value of the column for the rule if exists
    my $rule_required = 'required => 1,';           #used to construct the required portion of the rule
    my $rule_format = 'OPTION => {isa => \'TYPE\', REQUIRED DEFAULT},';

#     $content =~ s/package CLASS::API::Core::/package $$CLI{class}::API::Core::$base/s;    # add the proper class name to the package
    $content =~ s/package $$CLI{class}::API::Core::;/package $$CLI{class}::API::Core::$base;/s; # add the proper class name to the package

    foreach my $col (@{$$table_info{columns}}) {
        my $rule     = $rule_format;
        my $default  = $$col{COLUMN_DEFAULT} ? 'default => \'' . $$col{COLUMN_DEFAULT} . '\'' : '';
        my $required = $$col{IS_NULLABLE} eq 'YES' ? $rule_required : '';
        my $type     = 'Int' if $$col{DATA_TYPE} =~ /int/;
        $rule =~ s/DEFAULT/$default/s;
        $rule =~ s/REQUIRED/$required/s;
        $rule =~ s/TYPE/$type/s;
    }

    my $cli_rules  = "";
    my $cli_header = <<EO_CLI_HEADER;
my \$CLI = ParseCLI (
isfatal => 1,
rules => {
    $cli_rules
}

);
EO_CLI_HEADER

} ## end sub build_cli

__DATA__

# ----------------------------------------------------------------------------------------------------------------------
file-delimiter: Schema.pm

# use MooseX::Singleton;
has dbhost => (is => 'ro', isa => 'Str', required => 1, default => '192.168.11.7');
has dbport => (is => 'ro', isa => 'Int', required => 1, default => 3306);
has dbuser => (is => 'ro', isa => 'Str', required => 1, default => 'root');
has dbpass => (is => 'ro', isa => 'Str', required => 1, default => 'Nlvae4asd!');
has dbname => (is => 'ro', isa => 'Str', required => 1, default => 'tms');
has dbsock => (is => 'ro', isa => 'Str', required => 1, default => '/dbrelated/mysql.sock');

has DBIxHandle => (is => 'rw', lazy => 1, builder => 'ConnectToDB');

sub ConnectToDB {
    my $self = shift;
    my $dsnx = 'DBI:mysql:database=' . $self->dbname . ';';
    $dsnx .=
        $self->dbhost eq 'localhost'
        ? 'mysql_socket=' . $self->dbsock
        : 'host=' . $self->dbhost . ';port=' . $self->dbport;
    $dsnx .= ';';

    # my $schema = $self->connect($dsnx, $self->dbuser, $self->dbpass, {RaiseError => 1,AutoCommit=>0});
    my $schema = $self->connect($dsnx, $self->dbuser, $self->dbpass, {RaiseError => 1,AutoCommit=>1});
    $self->DBIxHandle($schema);
}

__PACKAGE__->meta->make_immutable(inline_constructor => 1);
1;

# ----------------------------------------------------------------------------------------------------------------------
file-delimiter: SchemaWrapper.pm

package CLASS::SchemaWrapper;
use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use Moose;
use CLASS::Schema;

my $SchemaObj = undef;

sub Schema {
    $SchemaObj = CLASS::Schema->new(host => '192.168.11.7')->DBIxHandle if !defined $SchemaObj;
    return $SchemaObj;
}

sub ResultSet {
    my $self = shift;
    (my $name = ref($self)) =~ s/.*:://g;
    return $self->Schema->DBIxHandle->resultset($name);
}

sub _meta_loop {
    $DB::single = 2;
    my $self   = shift;
    my $method = (caller(1))[3];
    my $data   = {};
    for my $attr ($self->meta->get_all_attributes) {
        my $name = $attr->name;
        my $type = ref($$self{$name});
        if ($type =~ /CLASS::/) {
            $$data{$name} = $self->$name->$method;
        } else {
            $$data{$name} = $self->$name if defined $self->$name;
        }
    }
    return $data;
}

sub DataHash { shift->_meta_loop }

sub UpdateOrCreate {
    my $self = shift;
    my $row  = $self->ResultSet->update_or_create($self->_meta_loop);
    return $row->id;
}

sub Create {
    my $self = shift;
    my $row  = $self->ResultSet->create($self->_meta_loop);
    return $row->id;
}

sub Find {
    my $self = shift;
    my $row  = $self->ResultSet->find($self->_meta_loop);
    return $row->id;
}

sub FindOrCreate {
    my $self = shift;
    my $row  = $self->ResultSet->find_or_create($self->_meta_loop);
    return $row->id;
}

sub Update {
    my $self = shift;
    my $row  = $self->ResultSet->update($self->_meta_loop);
    return $row->id;
}

sub Delete {
    my $self = shift;
    my $row = $self->ResultSet->find($self ->DataHash);
    return undef unless $row;
    $row->delete->in_storage;
}

sub Search {
    my $self = shift;
    return [$self->ResultSet->search(@_)->hashref_array()];
}

1;
# ----------------------------------------------------------------------------------------------------------------------
file-delimiter: result_set_suffix

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;

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
file-delimiter: ObjectTypes
package CLASS::API::Types::Objects;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Date::Manip;

use Moose::Util::TypeConstraints;


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

use Moose::Util::TypeConstraints;

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
