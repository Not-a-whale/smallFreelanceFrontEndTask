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

has 'AppAccountId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'DateCreated'  => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'Locked'       => ('is' => 'rw', 'isa' => 'BoolInt',       'required' => '1', 'default' => '0');

# relations
has 'app_roles_assigned' => ('is' => 'rw', 'isa' => 'ArrayObjAppRoleAssigned', 'required' => '0');
has 'app_account_locks'  => ('is' => 'rw', 'isa' => 'ArrayObjAppAccountLock',  'required' => '0');
has 'app_account_logins' => ('is' => 'rw', 'isa' => 'ArrayObjAppAccountLogin', 'required' => '0');
has 'user'               => ('is' => 'rw', 'isa' => 'ObjHrAssociate',          'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'AppAccount');

1;
