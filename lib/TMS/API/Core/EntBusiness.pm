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
use TMS::API::Types::Columns;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'BizId'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'BizURL' => ('is' => 'rw', 'isa' => 'VarChar1024',   'coerce' => '1', 'required' => '0');

# relations depends on
has 'has_carrier' => ('is' => 'rw', 'isa' => 'ObjEntCarrier', 'coerce' => '1', 'required' => '0');

# relations point to us
has 'biz_branches'       => ('is' => 'rw', 'isa' => 'ArrayObjBizBranch',   'coerce' => '1', 'required' => '0');
has 'crr_iftas'          => ('is' => 'rw', 'isa' => 'ArrayObjCrrIfta',     'coerce' => '1', 'required' => '0');
has 'cust_branches'      => ('is' => 'rw', 'isa' => 'ArrayObjBizBranch',   'coerce' => '1', 'required' => '0');
has 'ent_carrier'        => ('is' => 'rw', 'isa' => 'ObjEntCarrier',       'coerce' => '1', 'required' => '0');
has 'ent_customer'       => ('is' => 'rw', 'isa' => 'ObjEntCustomer',      'coerce' => '1', 'required' => '0');
has 'ent_owner_operator' => ('is' => 'rw', 'isa' => 'ObjEntOwnerOperator', 'coerce' => '1', 'required' => '0');
has 'ent_shipper'        => ('is' => 'rw', 'isa' => 'ObjEntShipper',       'coerce' => '1', 'required' => '0');
has 'entity'             => ('is' => 'rw', 'isa' => 'ObjEntity',           'coerce' => '1', 'required' => '0');
has 'ins_policies'       => ('is' => 'rw', 'isa' => 'ArrayObjInsPolicy',   'coerce' => '1', 'required' => '0');
has 'insr_branches'      => ('is' => 'rw', 'isa' => 'ArrayObjBizBranch',   'coerce' => '1', 'required' => '0');
has 'oper_branches'      => ('is' => 'rw', 'isa' => 'ArrayObjBizBranch',   'coerce' => '1', 'required' => '0');
has 'vend_branches'      => ('is' => 'rw', 'isa' => 'ArrayObjBizBranch',   'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'EntBusiness');

1;
