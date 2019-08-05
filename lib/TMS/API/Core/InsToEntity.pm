package TMS::API::Core::InsToEntity;

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
use TMS::API::Core::Entity;
use TMS::API::Core::InsPolicy;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InsId     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'InsPolicyObj',);
has EntityId  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntityObj',);
has DateAdded => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);

# AUTO-GENERATED HAS-A END

1;

