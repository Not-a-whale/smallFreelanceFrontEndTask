package TMS::API::Core::CntAddress;

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

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has AddrId  => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has Street1 => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has Street2 => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Street3 => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has City    => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has Zip     => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has State   => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has Country => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has GpsLng  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has GpsLat  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has Notes   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);

# AUTO-GENERATED HAS-A END

1;

