package TMS::API::Core::InvSprinter;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

$Data::Dumper::Terse = 1;

use Moose;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Complex;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'DoorHeight'              => ('is' => 'rw', 'isa' => 'Int',           'required' => '0');
has 'DoorWidth'               => ('is' => 'rw', 'isa' => 'Int',           'required' => '0');
has 'FuelTankCapacity'        => ('is' => 'rw', 'isa' => 'CurrencyValue', 'required' => '0');
has 'LoadCapacity'            => ('is' => 'rw', 'isa' => 'Int',           'required' => '0');
has 'LoadLength'              => ('is' => 'rw', 'isa' => 'Int',           'required' => '0');
has 'LoadVolume'              => ('is' => 'rw', 'isa' => 'Int',           'required' => '0');
has 'LoadWidth'               => ('is' => 'rw', 'isa' => 'Int',           'required' => '0');
has 'MilesPerGallonEstimated' => ('is' => 'rw', 'isa' => 'CurrencyValue', 'required' => '0');
has 'MilesPerGallonRated'     => ('is' => 'rw', 'isa' => 'Int',           'required' => '0');
has 'RoofHeight'              => ('is' => 'rw', 'isa' => 'Int',           'required' => '0');
has 'TowCapacity'             => ('is' => 'rw', 'isa' => 'Int',           'required' => '0');

# relations
has 'sprinter' => ('is' => 'rw', 'isa' => 'ObjInvVehicle', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InvSprinter');

1;
