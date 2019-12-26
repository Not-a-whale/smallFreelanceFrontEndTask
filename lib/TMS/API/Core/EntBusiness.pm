package TMS::API::Core::EntBusiness;

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

has 'BizId'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '0');
has 'BizURL' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

# relations
has 'entity'             => ('is' => 'rw', 'isa' => 'ObjEntity',           'coerce' => '1', 'required' => '0');
has 'ent_owner_operator' => ('is' => 'rw', 'isa' => 'ObjEntOwnerOperator', 'coerce' => '1', 'required' => '0');
has 'ent_carrier'        => ('is' => 'rw', 'isa' => 'ObjEntCarrier',       'coerce' => '1', 'required' => '0');
has 'biz_branches'       => ('is' => 'rw', 'isa' => 'ArrayObjBizBranch',   'coerce' => '1', 'required' => '0');
has 'ent_shipper'        => ('is' => 'rw', 'isa' => 'ObjEntShipper',       'coerce' => '1', 'required' => '0');
has 'ent_customer'       => ('is' => 'rw', 'isa' => 'ObjEntCustomer',      'coerce' => '1', 'required' => '0');
has 'crr_iftas'          => ('is' => 'rw', 'isa' => 'ArrayObjCrrIfta',     'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'EntBusiness');

1;
