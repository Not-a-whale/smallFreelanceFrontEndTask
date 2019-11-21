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
use TMS::API::Core::EntBusiness;
use TMS::API::Core::EntPerson;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has EntityId    => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has IsActive    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);
has DateCreated => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Notes       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has PersonId    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntPersonObj | Int ',);
has BusinessId  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntBusinessObj | Int ',);

# AUTO-GENERATED HAS-A END

1;

