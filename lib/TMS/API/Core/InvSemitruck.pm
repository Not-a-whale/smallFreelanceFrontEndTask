package TMS::API::Core::InvSemitruck;

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
has SemitruckId             => (is => 'rw', coerce => 1, isa => 'InvVehicleObj | Int ');
has FuelTankSize            => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has MilesPerGallonEstimated => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has MilesPerGallonRated     => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has TowCapacity             => (is => 'rw', coerce => 0, isa => 'Undef | Int');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'MilesPerGallonRated' => {
            'comment'  => 'manufacturer\'s claimed mpg',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'MilesPerGallonEstimated' => {
            'comment'  => 'estimated mpg from trip distances and fuel usage or reported by driver',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'decimal(12,2) unsigned'
        },
        'SemitruckId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::InvVehicle',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'TowCapacity' => {
            'comment'  => 'pounds',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'FuelTankSize' => {
            'is_null'  => 1,
            'comment'  => 'gallons',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'decimal(12,2) unsigned'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

