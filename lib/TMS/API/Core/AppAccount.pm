package TMS::API::Core::AppAccount;

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
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has AppAccountId => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has UserId       => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj',);
has PasswordHash => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has Salt         => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has Username     => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has DateCreated  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Locked       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);

# AUTO-GENERATED HAS-A END

1;

