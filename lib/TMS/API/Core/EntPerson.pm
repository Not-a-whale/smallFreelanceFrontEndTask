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

has 'MiddleName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1', 'default' => '');
has 'NickName'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1', 'default' => '');
has 'Prefix'     => ('is' => 'rw', 'isa' => 'Any',              'required' => '1', 'default' => '');
has 'PrsnId'     => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'Suffix'     => ('is' => 'rw', 'isa' => 'Any',              'required' => '1', 'default' => '');

# relations
has 'tsk_actns'    => ('is' => 'rw', 'isa' => 'ArrayObjTskActn', 'required' => '0');
has 'tsk_tasks'    => ('is' => 'rw', 'isa' => 'ArrayObjTskTask', 'required' => '0');
has 'tsk_times'    => ('is' => 'rw', 'isa' => 'ArrayObjTskTime', 'required' => '0');
has 'tsk_ntfis'    => ('is' => 'rw', 'isa' => 'ArrayObjTskNtfi', 'required' => '0');
has 'hr_associate' => ('is' => 'rw', 'isa' => 'ObjHrAssociate',  'required' => '0');
has 'entity'       => ('is' => 'rw', 'isa' => 'ObjEntity',       'required' => '0');
has 'tsk_resps'    => ('is' => 'rw', 'isa' => 'ArrayObjTskResp', 'required' => '0');
has 'brnch'        => ('is' => 'rw', 'isa' => 'ObjBizBranch',    'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'EntPerson');

1;
