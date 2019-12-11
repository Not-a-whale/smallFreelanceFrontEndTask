package TMS::API::Core::InvUnitReservation;

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
use TMS::API::Core::InvUnit;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::InvRole;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has ReservationId => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has PrsnId        => (is => 'rw', coerce => 1, isa => 'HrAssociateObj | Int ');
has UnitId        => (is => 'rw', coerce => 1, isa => 'InvUnitObj | Int ');
has InvRoleId     => (is => 'rw', coerce => 1, isa => 'InvRoleObj | Int ');
has DateReserved  => (is => 'rw', coerce => 1, isa => 'DATE');
has DateReleased  => (is => 'rw', coerce => 1, isa => 'Undef | DATE');
has CreatedBy     => (is => 'rw', coerce => 1, isa => 'Undef | HrAssociateObj | Int ');
has CreatedOn     => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'CreatedOn' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        },
        'DateReleased' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'date'
        },
        'ReservationId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'CreatedBy' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DateReserved' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'date'
        },
        'UnitId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::InvUnit',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'InvRoleId' => {
            'is_null' => 0,
            'comment' =>
                'this should be a table called \'Roles\' or \'People_Roles\' that should be a foreign key which is also tied to ent_people, and ent_people should be able to have mutliple Roles and have the dataentry user select the role from a dropdown that is specific to the person they are trying to reserve under.',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::InvRole',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'PrsnId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

