package TMS::API::Core::AppRoleAssigned;

# $Id: $
use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use Moose;

# AUTO-GENERATED DEPENDENCIES START
use TMS::API::Core::AppAccount;
use TMS::API::Core::AppRole;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has RolePermitId     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has AppAccountId     => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'AppAccountObj',);
has RoleId           => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'AppRoleObj',);
has ValidFrom        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATETIME',);
has ValidUntill      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has RoleAssignedBy   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj',);
has RoleAssignedDate => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);

# AUTO-GENERATED HAS-A END

1;

