package TMS::API::Core::FinAccount;

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
use TMS::API::Core::FinAccount;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has AccountId     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has AccountTypeId => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'FinAccountTypeObj',);
has ParentId      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'FinAccountObj',);
has UserDefined   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);
has Code          => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Active        => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);
has Valid         => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);
has DateCreated   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Name          => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has Description   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has ExternalName  => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Balance       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);

# AUTO-GENERATED HAS-A END

1;

