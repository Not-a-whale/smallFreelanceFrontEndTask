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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'PrsnId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

# relations
has 'brnch'        => ('is' => 'rw', 'isa' => 'ObjBizBranch',    'coerce' => '1', 'required' => '0');
has 'entity'       => ('is' => 'rw', 'isa' => 'ObjEntity',       'coerce' => '1', 'required' => '0');
has 'hr_associate' => ('is' => 'rw', 'isa' => 'ObjHrAssociate',  'coerce' => '1', 'required' => '0');
has 'hr_primary'   => ('is' => 'rw', 'isa' => 'ObjHrAssociate',  'coerce' => '1', 'required' => '0');
has 'tsk_actns'    => ('is' => 'rw', 'isa' => 'ArrayObjTskActn', 'coerce' => '1', 'required' => '0');
has 'tsk_ntfis'    => ('is' => 'rw', 'isa' => 'ArrayObjTskNtfi', 'coerce' => '1', 'required' => '0');
has 'tsk_resps'    => ('is' => 'rw', 'isa' => 'ArrayObjTskResp', 'coerce' => '1', 'required' => '0');
has 'tsk_tasks'    => ('is' => 'rw', 'isa' => 'ArrayObjTskTask', 'coerce' => '1', 'required' => '0');
has 'tsk_times'    => ('is' => 'rw', 'isa' => 'ArrayObjTskTime', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'EntPerson');

1;
