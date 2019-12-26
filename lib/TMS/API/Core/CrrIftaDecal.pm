package TMS::API::Core::CrrIftaDecal;

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

has 'CreatedBy'  => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'DateIssued' => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'DecalId'    => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

# relations
has 'vehicle'    => ('is' => 'rw', 'isa' => 'ObjInvVehicle',  'coerce' => '1', 'required' => '0');
has 'ifta_acct'  => ('is' => 'rw', 'isa' => 'ObjCrrIfta',     'coerce' => '1', 'required' => '0');
has 'created_by' => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'coerce' => '1', 'required' => '0');
has 'decal_img'  => ('is' => 'rw', 'isa' => 'ObjGenFile',     'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'CrrIftaDecal');

1;
