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
use TMS::API::Types::Columns;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'EquipmentTypeId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');

# relations point to us
has 'dsp_loads_required_equipments' =>
    ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsRequiredEquipment', 'coerce' => '1', 'required' => '0');
has 'inv_equipments' => ('is' => 'rw', 'isa' => 'ArrayObjInvEquipment', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InvEquipmentType');

1;
