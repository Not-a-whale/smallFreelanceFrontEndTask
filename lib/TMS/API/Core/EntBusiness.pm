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

has 'BizId'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'BizURL' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

# relations
has 'biz_branches'       => ('is' => 'rw', 'isa' => 'ArrayObjBizBranch',   'required' => '0');
has 'entity'             => ('is' => 'rw', 'isa' => 'ObjEntity',           'required' => '0');
has 'ent_carrier'        => ('is' => 'rw', 'isa' => 'ObjEntCarrier',       'required' => '0');
has 'ent_customer'       => ('is' => 'rw', 'isa' => 'ObjEntCustomer',      'required' => '0');
has 'ent_shipper'        => ('is' => 'rw', 'isa' => 'ObjEntShipper',       'required' => '0');
has 'crr_iftas'          => ('is' => 'rw', 'isa' => 'ArrayObjCrrIfta',     'required' => '0');
has 'ent_owner_operator' => ('is' => 'rw', 'isa' => 'ObjEntOwnerOperator', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'EntBusiness');

1;
