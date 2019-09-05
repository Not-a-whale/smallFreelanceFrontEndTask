package TMS::Test::Cases::BasicDataManip;

# $Id: $

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

our $ClassName;
our %TheDefault;

my $DataClass  = undef;
my $TestClass  = undef;
my $FillUpInst = undef;
my $FillUpData = undef;
my $Tester     = undef;

my @cases = qw(
    Test_Create
    Test_New_Dont_Coerce
    Test_New_Coerce
    Test_DataCompare
    Test_Create_Duplicate
    Test_Update
    Test_Update_Unique
    Test_Find
    Test_FindOrCreate_Existing
    Test_FindOrCreate_New
    Test_Delete_Uniq
    Test_Delete
    Test_UpdateDeleted
    Test_UpdateOrCreate_New
    Test_UpdateOrCreate_ExistingPK
    Test_UpdateOrCreate_ExistingUK
);

foreach my $CaseName (@cases) {    # print nice line before each test
    before $CaseName => sub {
        my ($line, $pads) = ('=' x 120, ' ' x 40);
        printf "\n\n%s\n%s%s\n%s\n", $line, $pads, $CaseName, $line;
    };
}

sub Test_Create {
    #    my $this = shift;
    #    my $self = $this->new(%{$this->DataRebuild});

    my $self = shift;

    try {
        my $row = $self->Create;
        ok($row->id, "Strict create of the new record");
    } catch {
        BAIL_OUT(longmess($_));
    } finally {
        $self->DataTell($self->Show);
    };
}

sub Test_New_Dont_Coerce {
    my $self = shift;
    my %data = map { $_, ' ' } $self->ColumnsList;
    my $name = "Strict create a new record with invalid data which cannot be coerced";
    $TMS::Test::DataGen::Types::Columns::AUTO_GENERATE = 0;
    $TMS::Test::DataGen::Types::Simple::AUTO_GENERATE  = 0;
    try {
        my $obj = $self->new(%data);
        ok(!defined($obj), $name);
    } catch {
        ok(/Attribute.*does not pass the type constraint because/s, $name);
    };
    $TMS::Test::DataGen::Types::Columns::AUTO_GENERATE = 1;
    $TMS::Test::DataGen::Types::Simple::AUTO_GENERATE  = 1;
}

sub Test_New_Coerce {
    my $self = shift;

    my $data = $self->DataHash;
    my $type = ref($self);
    my %fltr = map { $_, 1 } $self->NonPrimaryColumns;

    foreach (keys %$data) {
        delete $$data{$_} if !exists $fltr{$_};
        $$data{$_} = "  $$data{$_} " if defined $$data{$_};
    }

    try {
        my $obj = $self->new(%$data);
        ok(ref($obj) eq $type, "Create a new object with invalid data which can be coerced into a proper record");
        $obj->DataHashTell;
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_DataCompare {
    my $self = shift;
    try {
        my $DbData = $self->Show;
        ok(scalar(@$DbData) == 1, "List created a record, the output should contain exactly one row");
        $self->DataCompare("Compare input and output records", 1);
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_Create_Duplicate {
    my $self = shift;
    try {
        my $row = undef;

        $row = $self->Create;    # we expect Create() to fail, and got to the catch block at this point unless we've got a bug
        $row = $self->Create;

        ok(!$row, "Strict create a new record again using the same data as before");
        BAIL_OUT("A duplicate record was successfuly created. We do not expect that\n" . Dumper($row));
    } catch {
        ok(/execute failed: Duplicate entry/si, "Strict create a new record again using the same data as before");
    };
}

sub Test_Update {
    my $self = shift;

    my $Original = $self->DataHash;
    my $UpdateMe = $self->DataRebuild;
    my %PrimKeys = map { $_, 1 } $self->PrimaryColumns;
    try {
        $self->$_($$UpdateMe{$_}) foreach (grep { !exists $PrimKeys{$_} } keys %$UpdateMe);
        $self->Update();
        $self->DataCompare("Strict update on the primary key", undef);
        diag("Before Update: " . Dumper($Original));
        diag("After Update:  " . Dumper($UpdateMe));
        diag(Dumper($self->Show));
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_Update_Unique {
    my $self = shift;
    try {
        my $Constraints = $self->UniqueConstraints;    # get constraints
        if (scalar(keys %{$Constraints}) < 2) {
            ok(scalar(%$Constraints) < 2, "Skipping - no unique keys present");
            return undef;
        }
        my %PriKeyVals = map { $_, $self->$_ } $self->PrimaryColumns;    # save original primary keys

        my $Original = $self->DataHash;                                  # original data from object insatnce
        my $UpdateMe = undef;                                            # new data for update for object instance

        foreach my $ky (keys %$Constraints) {    # make sure keys stays the same between original and updated sets
            $$UpdateMe{$_} = $$Original{$_} foreach (@{$$Constraints{$ky}});
        }

        $self->$_($$UpdateMe{$_}) foreach keys %$UpdateMe;    # set updated values in the obj
        $self->$_(undef) foreach $self->PrimaryColumns;       # remove primary keys everywhere
        $UpdateMe = $self->DataHash;                          # store object instance data for verification

        $self->Update;
        $self->DataCompare("Strict update on unique key", undef);
        $self->DataTell({original => $Original, modified => $UpdateMe});

        $self->$_($PriKeyVals{$_}) foreach keys %PriKeyVals;    # restore primary keys
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_Find {
    my $self = shift;
    try {
        my $row = $self->Find;
        ok($row->id, "Find existing record");
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_FindOrCreate_Existing {
    my $self = shift;
    try {
        my $id  = $self->Find->id || confess "Unable to find existing record first";
        my $row = $self->FindOrCreate;
        ok($row->id == $id, "Find or create an existing record");
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_FindOrCreate_New {
    my $self = shift;
    try {
        $self->Find && confess "Record already exist...";
        $self->$_(undef) foreach $self->PrimaryColumns;

        my $row = $self->FindOrCreate;
        ok($row && $row->id, "Find or create an existing record");
        $self->Tell;
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_Delete_Uniq {
    my $self = shift;
    try {
        $self->$_(undef) foreach $self->PrimaryColumns;
        ok($self->Delete == 0, "Strict delete of created record") || confess "Unable to strict delete the record"
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_Delete {
    my $self = shift;
    try {
        ok($self->Delete == 0, "Strict delete of created record") || confess "Unable to strict delete the record"
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_UpdateDeleted {
    my $self = shift;
    my $cond = $self->FetchWhereKeys;
    try {
        diag('Deleting');
        $self->Delete == 0 || confess "Unable to strict delete the record";
        diag('Updating');
        ok(!defined($self->Update), "Strict update of the deleted record") || confess "update has returned a value";
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_UpdateOrCreate_New {
    my $self = shift;
    try {
        $self->Find && confess "Record already exists";
        my $row = $self->UpdateOrCreate;
        ok(defined $row && $row->id, "'Update Or Create' the new record when the record is not yet exists")
            || confess "Unable to create new record usining UpdateOrCreate() method";
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_UpdateOrCreate_ExistingPK {
    my $self = shift;

    my $Original = $self->DataHash;
    my $UpdateMe = $self->DataRebuild;
    my %PrimKeys = map { $_, 1 } $self->PrimaryColumns;

    try {
        $self->$_($$UpdateMe{$_}) foreach (grep { !exists $PrimKeys{$_} } keys %$UpdateMe);
        $self->UpdateOrCreate();
        $self->DataCompare("'Update Or Create' the new record when the record exists using primary keys", 1);
        diag("Before Update: " . Dumper($Original));
        diag("After Update:  " . Dumper($UpdateMe));
        diag(Dumper($self->Show));
    } catch {
        BAIL_OUT(longmess($_));
    };
}

sub Test_UpdateOrCreate_ExistingUK {
    my $self = shift;
    try {
        my $Constraints = $self->UniqueConstraints;    # get constraints

        if (scalar(keys %{$Constraints}) < 2) {
            ok(scalar(%$Constraints) < 2, "Skipping - no unique keys present");
            return undef;
        }

        my %PriKeyVals = map { $_, $self->$_ } $self->PrimaryColumns;    # save original primary keys

        my $Original = $self->DataHash;                                  # original data from object insatnce
        my $UpdateMe = undef;                                            # new data for update for object instance

        foreach my $ky (keys %$Constraints) {    # make sure keys stays the same between original and updated sets
            $$UpdateMe{$_} = $$Original{$_} foreach (@{$$Constraints{$ky}});
        }

        $self->$_($$UpdateMe{$_}) foreach keys %$UpdateMe;    # set updated values in the obj
        $self->$_(undef) foreach $self->PrimaryColumns;       # remove primary keys everywhere
        $UpdateMe = $self->DataHash;                          # store object instance data for verification

        $self->UpdateOrCreate;
        $self->DataCompare("Strict update on unique key", undef);
        $self->DataTell({original => $Original, modified => $UpdateMe});

        $self->$_($PriKeyVals{$_}) foreach keys %PriKeyVals;    # restore primary keys
    } catch {
        BAIL_OUT(longmess($_));
    };
}

#sub DEMOLISH {
#    my $self = shift;
#    print "Destroying: ";
#    $self->DataHashTell;
#    $self->Delete;
#    return $self;
#}

1;
