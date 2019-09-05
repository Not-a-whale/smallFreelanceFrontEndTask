package TMS::API::Core::FinPaymentTerm;

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
has PaymentTermId   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has Name            => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has DueNext         => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has DueInDays       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has DiscountAmount  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has DiscountPercent => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has DiscountInDays  => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Type            => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EnumStandard',);

# AUTO-GENERATED HAS-A END

1;

