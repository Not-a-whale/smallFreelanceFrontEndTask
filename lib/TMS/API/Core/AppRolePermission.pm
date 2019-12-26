package TMS::API::Core::AppRolePermission;

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

has 'RoleVsPermId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

# relations
has 'role'       => ('is' => 'rw', 'isa' => 'ObjAppRole',       'coerce' => '1', 'required' => '0');
has 'permission' => ('is' => 'rw', 'isa' => 'ObjAppPermission', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'AppRolePermission');

1;
