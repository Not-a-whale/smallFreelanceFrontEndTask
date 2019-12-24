package TMS::API::Core::FinBillingTag;

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

has 'BillingTagId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'CreatedBy'    => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'DateCreated'  => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'UserDefined'  => ('is' => 'rw', 'isa' => 'BoolInt',       'required' => '1', 'default' => '1');

# relations
has 'fin_billing_infos' => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingInfo', 'required' => '0');
has 'created_by'        => ('is' => 'rw', 'isa' => 'ObjHrAssociate',         'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinBillingTag');

1;
