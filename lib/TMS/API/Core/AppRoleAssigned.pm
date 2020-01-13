package TMS::API::Core::AppRoleAssigned;

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

has 'AppAccountId'     => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'RoleAssignedBy'   => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'RoleAssignedDate' => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'RoleId'           => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'RolePermitId'     => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');
has 'ValidUntill'      => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');

# relations
has 'app_account'      => ('is' => 'rw', 'isa' => 'ObjAppAccount',  'coerce' => '1', 'required' => '0');
has 'role'             => ('is' => 'rw', 'isa' => 'ObjAppRole',     'coerce' => '1', 'required' => '0');
has 'role_assigned_by' => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'AppRoleAssigned');

1;
