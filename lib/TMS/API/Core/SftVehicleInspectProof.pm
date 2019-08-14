package TMS::API::Core::SftVehicleInspectProof;

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
use TMS::API::Core::SftVehicleInspectedItem;
use TMS::API::Core::GenFile;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InspectImageId  => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has FileRef         => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'GenFileObj',);
has InspectedItemId => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'SftVehicleInspectedItemObj',);
has Notes           => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);

# AUTO-GENERATED HAS-A END

1;

