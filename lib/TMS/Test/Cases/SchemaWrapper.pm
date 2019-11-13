package TMS::Test::Cases::SchemaWrapper;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use 5.24.1;
use strict;
use diagnostics;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use Test::More;
use Moose::Role;

$Data::Dumper::Terse = 1;

my @cases = qw(
    Test_Relationships
    Test_RelationshipInfo
    Test_RelationshipAttr
    Test_ReverseRelationshipInfo
    Test_DataHash
    Test_Schema
    Test_Storage
    Test_ResultSet
    Test_ResultSource
    Test_PrimaryColumns
    Test_UniqueConstraints
    Test_ColumnsList
    Test_ColumnsInfo
);

foreach my $CaseName (@cases) {    # print nice line before each test
    before $CaseName => sub {
        my $self = shift;
        my ($line, $pads) = ('=' x 120, ' ' x 40);
        printf "\n\n%s\n%s%s %s\n%s\n", $line, $pads, ref($self), $CaseName, $line;
    };
}

sub Test_Relationships {
    my $self = shift;
    try {
        my @list = $self->Relationships;
        ok(@list, "Relationships list") && diag(Dumper(\@list));
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_RelationshipAttr {
    my $self = shift;
    try {
        my $info = $self->RelationshipAttr;
        if (defined $info) {
            ok($info, "Relationships Attributes Found");
            diag(Dumper($info));
        } else {
            diag("No FK found");
        }
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_RelationshipInfo {
    my $self = shift;
    try {
        my $info = $self->RelationshipInfo;
        ok($info, "Relationships Info") && diag(Dumper($info));
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_ReverseRelationshipInfo {
    my $self = shift;
    try {
        my $info = $self->RelationshipInfo;
        ok($info, "Relationships Info") && diag(Dumper($info));
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_DataHash {
    my $self = shift;
    try {
        my $DataHash = $self->DataHash;
        my @ColsList = $self->NonPrimaryColumns;
        my $FkeyList = $self->RelationshipAttr;

        ok(ref($DataHash) eq 'HASH', "Get generated data from DataGen instance and make sure it's a hash")
            || confess "DataHash call has not returned a hash";
        print Dumper($DataHash);

        my $NonEmptyFieldCount = scalar(@ColsList);
        my $ActualFieldsFound  = 0;
        my $OkToIgnoreColumns  = 0;

        foreach (@ColsList) {
            if (exists $$DataHash{$_} && defined $$DataHash{$_} && $$DataHash{$_} =~ /\S+/) {
                $ActualFieldsFound++;
            } else {
                $OkToIgnoreColumns++ if defined $FkeyList && exists $$FkeyList{$_};
            }
        }

        ok(($ActualFieldsFound + $OkToIgnoreColumns) == $NonEmptyFieldCount, "Verify generated data is not an empty hash")
            || confess "Generated data is insufficient. Expecting $NonEmptyFieldCount, "
            . "got $ActualFieldsFound, while ok to ignore count is $OkToIgnoreColumns";

    } catch {
        BAIL_OUT(longmess($_));

    } finally {
        $self->DataTell($self->DataHash);
    };
}

sub Test_Schema {
    my $self = shift;
    try {
        my $SchemaObj = $self->Schema;
        isa_ok($SchemaObj, 'TMS::Schema');
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_Storage {
    my $self = shift;
    try {
        my $StorageObj = $self->Storage;
        isa_ok($StorageObj, 'DBIx::Class::Storage::DBI');
        confess sprintf "Unexpected storage type \"%s\", expecting \"%s\"", ref($StorageObj), 'DBIx::Class::Storage::DBI'
            unless ref($StorageObj) eq 'DBIx::Class::Storage::DBI';
    } catch {
        BAIL_OUT($_);
    };
}

sub Test_ResultSet {
    my $self         = shift;
    my $ResultSetObj = undef;
    try {
        $ResultSetObj = $self->ResultSet;
    } catch {
        BAIL_OUT(longmess($_));
    } finally {
        isa_ok($ResultSetObj, 'DBIx::Class::ResultSet::HashRef');
    };
}

sub Test_ResultSource {
    my $self            = shift;
    my $ResultSourceObj = undef;
    try {
        $ResultSourceObj = $self->ResultSource;
    } catch {
        BAIL_OUT(longmess($_));
    } finally {
        isa_ok($ResultSourceObj, 'DBIx::Class::ResultSource::Table');
    };
}

sub Test_PrimaryColumns {
    my $self = shift;
    try {
        my @PrimaryKeys = $self->PrimaryColumns;
        ok(scalar(@PrimaryKeys), "Show primary keys");
        diag('Primary Keys: ' . join(',', @PrimaryKeys));
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_UniqueConstraints {
    my $self = shift;
    try {
        my $UniqueConstraints = $self->UniqueConstraints;
        ok(scalar(%$UniqueConstraints), "Show Unique Constraints");
        diag(Dumper($UniqueConstraints));
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_ColumnsList {
    my $self = shift;
    try {
        my @ColumnsList = $self->ColumnsList;
        ok(scalar(@ColumnsList), "Show column list directly from DBIx");

        my $AllFound    = 0;
        my %ClassFields = map { $_->name, 1 } $self->meta->get_all_attributes;

        foreach (@ColumnsList) {
            if (exists $ClassFields{$_}) {
                $AllFound++;
            } else {
                confess "Column '$_' is not found within class '" . ref($self) . "' attributes";
            }
        }
        ok(scalar(@ColumnsList) == $AllFound,
            "Compare column list from DBIx with attributes from TMS::API::Core::CLASS instance");
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_ColumnsInfo {
    my $self = shift;
    try {
        my $ColumnInfo = $self->ColumnsInfo();
        ok(scalar(%$ColumnInfo), "Get detailed information about columns.");
        diag(Dumper($ColumnInfo));
    } catch {
        BAIL_OUT(longmess($_));
    };
}

1;
