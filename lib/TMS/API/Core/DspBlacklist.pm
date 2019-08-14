package TMS::API::Core::DspBlacklist;

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
use TMS::API::Core::EntCustomer;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has BlackListId   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has CstmrId       => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntCustomerObj',);
has DateCreated   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATETIME',);
has Creator       => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj',);
has ReasonPublic  => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has ReasonPrivate => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);

# AUTO-GENERATED HAS-A END

1;

