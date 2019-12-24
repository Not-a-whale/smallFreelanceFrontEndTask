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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'StatePrmtId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

# relations
has 'crr_permit_images' => ('is' => 'rw', 'isa' => 'ArrayObjCrrPermitImage', 'required' => '0');
has 'vehicle'           => ('is' => 'rw', 'isa' => 'ObjInvVehicle',          'required' => '0');
has 'crr_prmt_acc'      => ('is' => 'rw', 'isa' => 'ObjCrrPermitAccount',    'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'CrrStatePermit');

1;
