package TMS::API::Core::SftLogbook;

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
use TMS::API::Core::DspTrip;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has LogbookId   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has DateStarted => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);
has Notes       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Trip        => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'DspTripObj',);

# AUTO-GENERATED HAS-A END

1;

