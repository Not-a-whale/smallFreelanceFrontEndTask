package TMS::API::Core::DspLoadsDestinationsDoc;

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
use TMS::API::Core::GenFile;
use TMS::API::Core::DspLoadsDestination;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has LoadDestinationId => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DspLoadsDestinationObj',);
has FileId            => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'GenFileObj',);
has Verified          => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumUnknown',);
has ApprovedBy        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntPersonObj',);

# AUTO-GENERATED HAS-A END

1;

