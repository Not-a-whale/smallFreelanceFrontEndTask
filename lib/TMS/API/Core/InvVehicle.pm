package TMS::API::Core::InvVehicle;

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
use TMS::API::Core::InvTiresize;
use TMS::API::Core::EntCarrier;
use TMS::API::Core::InvEquipment;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has VehicleId     => (is => 'rw', coerce => 1, isa => 'InvEquipmentObj | Int ');
has CarrierId     => (is => 'rw', coerce => 1, isa => 'EntCarrierObj | Int ');
has Make          => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Model         => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Color         => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has VIN           => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has TireSize      => (is => 'rw', coerce => 1, isa => 'Undef | InvTiresizeObj | Int ');
has Year          => (is => 'rw', coerce => 1, isa => 'Undef | YEAR');
has Axels         => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has Length        => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has Height        => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has Width         => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has UnladenWeight => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has Fuel          => (is => 'rw', coerce => 1, isa => 'Undef | EnumNone');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'Height' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'UnladenWeight' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'int(11)'
        },
        'VehicleId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::InvEquipment',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Make' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(24)'
        },
        'Year' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'year(4)'
        },
        'Fuel' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'none',
            'db_type'  => 'enum(\'none\',\'deisel\',\'unleaded\')'
        },
        'Length' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'CarrierId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::EntCarrier',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Color' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(24)'
        },
        'Model' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(24)'
        },
        'TireSize' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => 'TMS::API::Core::InvTiresize',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Width' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'VIN' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'varchar(19)'
        },
        'Axels' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'int(11)'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

