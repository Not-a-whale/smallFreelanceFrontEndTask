package TMS::API::Core::CrrStatePermit;

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

has 'CrrPrmtAccId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'StatePrmtId'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'VehicleId'    => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');

# relations depends on
has 'crr_prmt_acc' => ('is' => 'rw', 'isa' => 'ObjCrrPermitAccount', 'coerce' => '1', 'required' => '0');
has 'vehicle'      => ('is' => 'rw', 'isa' => 'ObjInvVehicle',       'coerce' => '1', 'required' => '0');

# relations point to us
has 'crr_permit_images' => ('is' => 'rw', 'isa' => 'ArrayObjCrrPermitImage', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'CrrStatePermit');

1;
