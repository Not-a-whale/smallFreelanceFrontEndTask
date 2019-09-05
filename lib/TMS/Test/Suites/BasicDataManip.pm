package  TMS::Test::Suites::BasicDataManip;

# $Id: $

use strict;
use diagnostics;
use warnings FATAL => 'all';
use Devel::Confess;
use Moose::Role;

sub BasicDataManipAll {
    my $self = shift;

    $self->Test_New_Dont_Coerce;
    $self->Test_New_Coerce;
    $self->Test_Create;
    $self->Test_DataCompare;
    $self->Test_Create_Duplicate;
    $self->Test_Find;
    $self->Test_FindOrCreate_Existing;
    $self->Test_Update;
    $self->Test_Update_Unique;
    $self->Test_Delete;
    $self->Test_UpdateDeleted;
    $self->Test_FindOrCreate_New;
    $self->Test_Delete_Uniq;
    $self->Test_UpdateOrCreate_New;
    $self->Test_UpdateOrCreate_ExistingPK;
    $self->Test_UpdateOrCreate_ExistingUK;
    $self->Test_Delete;
}

1;
