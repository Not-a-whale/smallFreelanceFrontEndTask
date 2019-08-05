package TMS::API::Core::DspBlacklist;

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
use TMS::API::Core::EntPerson;
use TMS::API::Core::Job;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has BlackListId   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has EntityId      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntityObj',);
has DateCreated   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATETIME',);
has Creator       => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntPersonObj',);
has ReasonPublic  => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has ReasonPrivate => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has JobId         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'JobObj',);

# AUTO-GENERATED HAS-A END

1;

