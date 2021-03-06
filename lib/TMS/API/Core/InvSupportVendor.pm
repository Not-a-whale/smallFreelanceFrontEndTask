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
use TMS::API::Types::Columns;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'Description'    => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'PrimaryContact' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'SupportId'      => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '1', 'required' => '0');
has 'VendorId'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');

# relations depends on
has 'primary_contact' => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'coerce' => '1', 'required' => '0');
has 'vendor'          => ('is' => 'rw', 'isa' => 'ObjBizBranch',   'coerce' => '1', 'required' => '0');

# relations point to us
has 'inv_equipments_to_support' => ('is' => 'rw', 'isa' => 'ArrayObjInvEquipmentToSupport', 'coerce' => '1', 'required' => '0');
has 'msg_inv_support_vendors'   => ('is' => 'rw', 'isa' => 'ArrayObjMsgInvSupportVendor',   'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InvSupportVendor');

1;
