package TMS::API::Core::SftVehicleRegistration;

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

# relations
has 'vehicle'           => ('is' => 'rw', 'isa' => 'ObjInvVehicle', 'coerce' => '1', 'required' => '0');
has 'registration_card' => ('is' => 'rw', 'isa' => 'ObjGenFile',    'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'SftVehicleRegistration');

1;
