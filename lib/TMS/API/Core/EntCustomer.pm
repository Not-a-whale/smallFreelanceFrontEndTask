package TMS::API::Core::EntCustomer;

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

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has CstmrId          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntBusinessObj',);
has MC               => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has DOT              => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has SCAC             => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Terms            => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Factoring        => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'ENUM',);
has CreditLimit      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has Bond             => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has DUNS             => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has DontUse          => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'EnumDoNotUse',);
has WhyDontUse       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has RequireOriginals => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);

# AUTO-GENERATED HAS-A END

1;

