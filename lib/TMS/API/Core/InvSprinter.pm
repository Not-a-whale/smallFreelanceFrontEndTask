package TMS::API::Core::InvSprinter;

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
use TMS::API::Core::InvVehicle;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has SprinterId              => (is => 'rw', coerce => 1, isa => 'InvVehicleObj | Int ');
has FuelTankCapacity        => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has MilesPerGallonEstimated => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has MilesPerGallonRated     => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has LoadLength              => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has LoadWidth               => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has RoofHeight              => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has DoorHeight              => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has DoorWidth               => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has TowCapacity             => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has LoadCapacity            => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has LoadVolume              => (is => 'rw', coerce => 0, isa => 'Undef | Int');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'DoorHeight' => {
            'is_null'  => 1,
            'comment'  => 'inches',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'LoadWidth' => {
            'comment'  => 'inches',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'SprinterId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::InvVehicle',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'MilesPerGallonRated' => {
            'is_null'  => 1,
            'comment'  => 'manufacturer\'s claimed mpg',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'LoadLength' => {
            'comment'  => 'inches',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'MilesPerGallonEstimated' => {
            'comment'  => 'estimate from trip distances and fuel usage or reported from driver',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'decimal(12,2) unsigned'
        },
        'TowCapacity' => {
            'comment'  => 'pounds',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'RoofHeight' => {
            'comment'  => 'inches, top of bed floor to bottom of ceiling',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'LoadCapacity' => {
            'is_null'  => 1,
            'comment'  => 'pounds',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'DoorWidth' => {
            'is_null'  => 1,
            'comment'  => 'inches',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'FuelTankCapacity' => {
            'comment'  => 'gallons',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'decimal(12,2) unsigned'
        },
        'LoadVolume' => {
            'comment'  => 'cubic inches',
            'is_null'  => 1,
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

