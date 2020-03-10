package TMS::API::Core::EntPerson;

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

has 'BrnchId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'PrsnId'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');

# relations depends on
has 'brnch'            => ('is' => 'rw', 'isa' => 'ObjBizBranch', 'coerce' => '1', 'required' => '0');
has 'brnch_customer'   => ('is' => 'rw', 'isa' => 'ObjBizBranch', 'coerce' => '1', 'required' => '0');
has 'brnch_dispatcher' => ('is' => 'rw', 'isa' => 'ObjBizBranch', 'coerce' => '1', 'required' => '0');
has 'brnch_driver'     => ('is' => 'rw', 'isa' => 'ObjBizBranch', 'coerce' => '1', 'required' => '0');
has 'brnch_owner'      => ('is' => 'rw', 'isa' => 'ObjBizBranch', 'coerce' => '1', 'required' => '0');
has 'brnch_shipper'    => ('is' => 'rw', 'isa' => 'ObjBizBranch', 'coerce' => '1', 'required' => '0');
has 'brnch_vendor'     => ('is' => 'rw', 'isa' => 'ObjBizBranch', 'coerce' => '1', 'required' => '0');

# relations point to us
has 'entity'       => ('is' => 'rw', 'isa' => 'ObjEntity',       'coerce' => '1', 'required' => '0');
has 'hr_associate' => ('is' => 'rw', 'isa' => 'ObjHrAssociate',  'coerce' => '1', 'required' => '0');
has 'tsk_actns'    => ('is' => 'rw', 'isa' => 'ArrayObjTskActn', 'coerce' => '1', 'required' => '0');
has 'tsk_ntfis'    => ('is' => 'rw', 'isa' => 'ArrayObjTskNtfi', 'coerce' => '1', 'required' => '0');
has 'tsk_resps'    => ('is' => 'rw', 'isa' => 'ArrayObjTskResp', 'coerce' => '1', 'required' => '0');
has 'tsk_tasks'    => ('is' => 'rw', 'isa' => 'ArrayObjTskTask', 'coerce' => '1', 'required' => '0');
has 'tsk_times'    => ('is' => 'rw', 'isa' => 'ArrayObjTskTime', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'EntPerson');

1;
