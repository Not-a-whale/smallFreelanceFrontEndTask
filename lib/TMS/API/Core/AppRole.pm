package TMS::API::Core::AppRole;

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

has 'CreatedBy'   => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'DateCreated' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DateUpdated' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'Description' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Editable'    => ('is' => 'rw', 'isa' => 'BoolInt',          'required' => '0', 'default' => '1');
has 'RoleId'      => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'UpdatedBy'   => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'UserDefined' => ('is' => 'rw', 'isa' => 'BoolInt',          'required' => '0', 'default' => '1');

# relations
has 'app_role_menuses'     => ('is' => 'rw', 'isa' => 'ArrayObjAppRoleMenus',      'required' => '0');
has 'app_roles_assigned'   => ('is' => 'rw', 'isa' => 'ArrayObjAppRoleAssigned',   'required' => '0');
has 'updated_by'           => ('is' => 'rw', 'isa' => 'ObjHrAssociate',            'required' => '0');
has 'app_role_permissions' => ('is' => 'rw', 'isa' => 'ArrayObjAppRolePermission', 'required' => '0');
has 'created_by'           => ('is' => 'rw', 'isa' => 'ObjHrAssociate',            'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'AppRole');

1;
