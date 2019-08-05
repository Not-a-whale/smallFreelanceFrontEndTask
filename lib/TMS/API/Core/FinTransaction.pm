package TMS::API::Core::FinTransaction;

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
use TMS::API::Core::EntPerson;
use TMS::API::Core::FinClass;
use TMS::API::Core::Job;
use TMS::API::Core::FinTransactionType;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has TransactionId   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has TransactionType => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'FinTransactionTypeObj',);
has RefNumber       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has JobId           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'JobObj',);
has CreatedBy       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntPersonObj',);
has DateCreated     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has DateTransaction => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Status          => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'EnumValid',);
has Memo            => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Class           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'FinClassObj',);

# AUTO-GENERATED HAS-A END

1;

