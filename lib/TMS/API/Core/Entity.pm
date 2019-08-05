package TMS::API::Core::Entity;

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
use TMS::API::Core::EntPerson;
use TMS::API::Core::EntBusiness;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has EntityId    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has IsActive    => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);
has DateCreated => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Notes       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has PersonId    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntPersonObj',);
has BusinessId  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntBusinessObj',);

# AUTO-GENERATED HAS-A END

1;

