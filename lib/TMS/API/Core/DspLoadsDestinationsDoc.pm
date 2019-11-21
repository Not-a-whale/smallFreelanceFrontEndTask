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
use TMS::API::Core::DspLoadsDestination;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::GenFile;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has DestFileId        => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has LoadDestinationId => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DspLoadsDestinationObj | Int ',);
has FileId            => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'GenFileObj | Int ',);
has Verified          => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EnumUnknown',);
has ApprovedBy        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj | Int ',);
has FactoredDoc       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);

# AUTO-GENERATED HAS-A END

1;

