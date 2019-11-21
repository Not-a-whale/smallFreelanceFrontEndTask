package TMS::API::Core::FinBillingBank;

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
use TMS::API::Core::BizBranch;
use TMS::API::Core::FinBillingInfo;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has BankId        => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has BillingId     => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'FinBillingInfoObj | Int ',);
has Institution   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'BizBranchObj | Int ',);
has AccountNumber => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has RoutingNumber => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has AccountType   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EnumChecking',);
has Purpose       => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EnumPayment',);
has Active        => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);
has Notes         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);

# AUTO-GENERATED HAS-A END

1;

