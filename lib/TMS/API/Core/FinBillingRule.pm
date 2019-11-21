package TMS::API::Core::FinBillingRule;

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
use TMS::API::Core::FinBillingBank;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has BillRuleId  => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has BankAccount => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'FinBillingBankObj | Int ',);
has Rule        => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumPercentage',);
has Amount      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has Notes       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Active      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);

# AUTO-GENERATED HAS-A END

1;

