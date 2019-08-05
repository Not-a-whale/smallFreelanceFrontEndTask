package TMS::API::Core::InsPolicy;

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
use TMS::API::Core::GenFile;
use TMS::API::Core::EntPerson;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InsId             => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has ProviderAgent     => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntPersonObj',);
has ProofOfInsurance  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'GenFileObj',);
has TagName           => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has WhatIsInsured     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has PolicyNumber      => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has EffectiveDate     => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);
has ExpirationDate    => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);
has InsuredAmount     => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'Float',);
has DownpaymentAmount => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has PaidBy            => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'EnumOwner',);

# AUTO-GENERATED HAS-A END

1;

