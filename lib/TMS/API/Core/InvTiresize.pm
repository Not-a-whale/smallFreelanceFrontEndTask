package TMS::API::Core::InvTiresize;

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

has 'TireId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'Type'   => ('is' => 'rw', 'isa' => 'Any',           'required' => '1', 'default' => 'Truck');

# relations
has 'inv_vehicles' => ('is' => 'rw', 'isa' => 'ArrayObjInvVehicle', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InvTiresize');

1;
