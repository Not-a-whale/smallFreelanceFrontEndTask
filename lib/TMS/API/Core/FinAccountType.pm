package TMS::API::Core::FinAccountType;

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
use TMS::API::Core::FinAccountType;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has AccountTypeId => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has Name          => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has ParentId      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'FinAccountTypeObj',);
has Editable      => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);
has Valid         => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);
has UserDefined   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);
has Debit         => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Credit        => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Temp          => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);
has DisplayOrder  => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has BalanceSheet  => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);
has IncomeSheet   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);

# AUTO-GENERATED HAS-A END

1;

