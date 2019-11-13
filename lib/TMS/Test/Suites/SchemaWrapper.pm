package TMS::Test::Suites::SchemaWrapper;

use strict;
use diagnostics;
use warnings FATAL => 'all';
use Devel::Confess;
use Moose::Role;

sub SchemaWrapperAll {
    my $self = shift;
    $self->Test_Schema;
    $self->Test_Storage;
    $self->Test_ResultSet;
    $self->Test_ResultSource;

    $self->Test_Relationships;
    $self->Test_RelationshipInfo;
    $self->Test_RelationshipAttr;
    $self->Test_ReverseRelationshipInfo;

    $self->Test_PrimaryColumns;
    $self->Test_UniqueConstraints;
    $self->Test_ColumnsList;
    $self->Test_ColumnsInfo;
    $self->Test_DataHash;
}

1;
