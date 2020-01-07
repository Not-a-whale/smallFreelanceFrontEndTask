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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'AppAccountId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');
has 'DateCreated'  => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');

# relations
has 'app_account_locks'  => ('is' => 'rw', 'isa' => 'ArrayObjAppAccountLock',  'coerce' => '1', 'required' => '0');
has 'app_account_logins' => ('is' => 'rw', 'isa' => 'ArrayObjAppAccountLogin', 'coerce' => '1', 'required' => '0');
has 'app_roles_assigned' => ('is' => 'rw', 'isa' => 'ArrayObjAppRoleAssigned', 'coerce' => '1', 'required' => '0');
has 'user'               => ('is' => 'rw', 'isa' => 'ObjHrAssociate',          'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'AppAccount');

1;
