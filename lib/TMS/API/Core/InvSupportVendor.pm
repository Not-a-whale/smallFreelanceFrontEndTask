package TMS::API::Core::InvSupportVendor;

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

has 'Description'    => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'PrimaryContact' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

# relations
has 'primary_contact'           => ('is' => 'rw', 'isa' => 'ObjHrAssociate',                'required' => '0');
has 'vendor'                    => ('is' => 'rw', 'isa' => 'ObjBizBranch',                  'required' => '0');
has 'inv_equipments_to_support' => ('is' => 'rw', 'isa' => 'ArrayObjInvEquipmentToSupport', 'required' => '0');

has '_dbix_class' =>
    (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InvSupportVendor');

1;
