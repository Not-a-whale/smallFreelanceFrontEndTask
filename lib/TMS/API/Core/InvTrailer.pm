package TMS::API::Core::InvTrailer;

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

has 'DoorHeight'   => ('is' => 'rw', 'isa' => 'Int',         'coerce' => '0', 'required' => '0');
has 'DoorWidth'    => ('is' => 'rw', 'isa' => 'Int',         'coerce' => '0', 'required' => '0');
has 'LoadCapactiy' => ('is' => 'rw', 'isa' => 'Int',         'coerce' => '0', 'required' => '0');
has 'LoadHeight'   => ('is' => 'rw', 'isa' => 'Int',         'coerce' => '0', 'required' => '0');
has 'LoadLength'   => ('is' => 'rw', 'isa' => 'Int',         'coerce' => '0', 'required' => '0');
has 'LoadVolume'   => ('is' => 'rw', 'isa' => 'Int',         'coerce' => '0', 'required' => '0');
has 'LoadWidth'    => ('is' => 'rw', 'isa' => 'Int',         'coerce' => '0', 'required' => '0');
has 'TrailerId'    => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

# relations
has 'trailer' => ('is' => 'rw', 'isa' => 'ObjInvVehicle',     'coerce' => '1', 'required' => '0');
has 'type'    => ('is' => 'rw', 'isa' => 'ObjInvTrailerType', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InvTrailer');

1;
