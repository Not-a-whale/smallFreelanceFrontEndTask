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
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has CstmrId          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntBusinessObj | Int ',);
has MC               => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has DOT              => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has SCAC             => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Terms            => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Factoring        => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumYes',);
has CreditLimit      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has Bond             => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has DUNS             => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has DontUse          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumDoNotUse',);
has WhyDontUse       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has RequireOriginals => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);

# AUTO-GENERATED HAS-A END

1;

