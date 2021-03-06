package TMS::API::Core::AppAccount;

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

has 'AppAccountId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'DateCreated'  => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'UserId'       => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');

# relations depends on
has 'user' => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'coerce' => '1', 'required' => '0');

# relations point to us
has 'app_account_locks'  => ('is' => 'rw', 'isa' => 'ArrayObjAppAccountLock',  'coerce' => '1', 'required' => '0');
has 'app_account_logins' => ('is' => 'rw', 'isa' => 'ArrayObjAppAccountLogin', 'coerce' => '1', 'required' => '0');
has 'app_roles_assigned' => ('is' => 'rw', 'isa' => 'ArrayObjAppRoleAssigned', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'AppAccount');

1;
