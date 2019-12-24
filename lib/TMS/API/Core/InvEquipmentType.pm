package TMS::API::Core::InvEquipmentType;

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
has 'inv_equipments' => ('is' => 'rw', 'isa' => 'ArrayObjInvEquipment', 'required' => '0');
has 'dsp_loads_required_equipments' =>
    ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsRequiredEquipment', 'required' => '0');

has '_dbix_class' =>
    (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InvEquipmentType');

1;
