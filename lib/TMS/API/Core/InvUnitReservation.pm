package TMS::API::Core::InvUnitReservation;

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

has 'CreatedBy'     => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'CreatedOn'     => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'DateReleased'  => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'ReservationId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

# relations
has 'unit'       => ('is' => 'rw', 'isa' => 'ObjInvUnit',     'required' => '0');
has 'prsn'       => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'required' => '0');
has 'inv_role'   => ('is' => 'rw', 'isa' => 'ObjInvRole',     'required' => '0');
has 'created_by' => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'required' => '0');

has '_dbix_class' =>
    (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InvUnitReservation');

1;
