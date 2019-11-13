package TMS::API::Core::FinInvoiceAmount;

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
has InvoiceId      => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Int',);
has EntityId       => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Int',);
has PaymentTermsId => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Int',);
has DateCreated    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has RefNumber      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Notes          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Comments       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has PONumber       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Status         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumInvalid',);
has DateInvoiced   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has FactoredParent => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Amount         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);

# AUTO-GENERATED HAS-A END

1;

