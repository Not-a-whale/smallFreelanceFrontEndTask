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
use TMS::API::Core::HrAssociate;
use TMS::API::Core::FinTransactionType;
use TMS::API::Core::FinClass;
use TMS::API::Core::FinJob;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has TransactionId   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has TransactionType => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'FinTransactionTypeObj | Int ',);
has RefNumber       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has JobId           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'FinJobObj | Int ',);
has CreatedBy       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'HrAssociateObj | Int ',);
has DateCreated     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has DateTransaction => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Status          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumValid',);
has Class           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'FinClassObj | Int ',);
has Memo            => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);

# AUTO-GENERATED HAS-A END

1;

