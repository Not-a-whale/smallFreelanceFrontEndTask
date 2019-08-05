package TMS::API::Core::FinItemTemplate;

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
use TMS::API::Core::FinAccount;
use TMS::API::Core::FinTransactionType;
use TMS::API::Core::FinItemTemplatesType;
use TMS::API::Core::FinItemTemplate;
use TMS::API::Core::Entity;
use TMS::API::Core::EntPerson;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has ItemTemplateId  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has TemplateTypeId  => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'FinItemTemplatesTypeObj',);
has EntityId        => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntityObj',);
has DebitAccountId  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'FinAccountObj',);
has CreditAccountId => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'FinAccountObj',);
has CreatedBy       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntPersonObj',);
has ParentId        => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'FinItemTemplateObj',);
has DateCreated     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Price           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has UserDefined     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);
has PriceType       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'EnumFlatRate',);
has Name            => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has Description     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Deleted         => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);
has DeletedBy       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntPersonObj',);
has DateDeleted     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has UpdatedBy       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has DateUpdated     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has TransactionType => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'FinTransactionTypeObj',);

# AUTO-GENERATED HAS-A END

1;

