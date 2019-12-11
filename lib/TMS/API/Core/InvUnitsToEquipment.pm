package TMS::API::Core::InvUnitsToEquipment;

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
use TMS::API::Core::InvEquipment;
use TMS::API::Core::InvUnit;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has EquipUnitResId => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has UnitId         => (is => 'rw', coerce => 1, isa => 'InvUnitObj | Int ');
has EquipmentId    => (is => 'rw', coerce => 1, isa => 'InvEquipmentObj | Int ');
has DateAdded      => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has AddedBy        => (is => 'rw', coerce => 1, isa => 'HrAssociateObj | Int ');
has DateRemoved    => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has RemovedBy      => (is => 'rw', coerce => 1, isa => 'Undef | HrAssociateObj | Int ');
has Notes          => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'EquipUnitResId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'EquipmentId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::InvEquipment',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DateRemoved' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'RemovedBy' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'AddedBy' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'UnitId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::InvUnit',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DateAdded' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        },
        'Notes' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'text'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

