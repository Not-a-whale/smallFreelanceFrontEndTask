package TMS::API::Core::CmmAssignmentsCustomer;

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
use TMS::API::Core::CmmPackage;
use TMS::API::Core::EntPerson;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has AssociateId       => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj',);
has CommissionPackage => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'CmmPackageObj',);
has DateAdded         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has AddedBy           => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntPersonObj',);
has CustomerId        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntCustomerObj',);

# AUTO-GENERATED HAS-A END

1;
