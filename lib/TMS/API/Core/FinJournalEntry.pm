package TMS::API::Core::FinJournalEntry;

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
<<<<<<< HEAD
use TMS::API::Core::Entity;
use TMS::API::Core::FinTransaction;
use TMS::API::Core::FinJob;
use TMS::API::Core::HrAssociate;
=======
use TMS::API::Core::HrAssociate;
use TMS::API::Core::Entity;
use TMS::API::Core::FinJob;
use TMS::API::Core::FinTransaction;
>>>>>>> d8b237c0a271ea8cabf70fd6a1180c53f82a77e0
use TMS::API::Core::FinAccount;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has JrlEntryId     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has TransactionId  => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'FinTransactionObj | Int ',);
has AccountId      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'FinAccountObj | Int ',);
has EntityId       => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntityObj | Int ',);
has CreatedBy      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'HrAssociateObj | Int ',);
has DateCreated    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has DebitCredit    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumDebit',);
has Amount         => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'Float',);
has Classification => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumCustomer',);
has JobId          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'FinJobObj | Int ',);
has VendorAmount   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has ReportAmount   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);

# AUTO-GENERATED HAS-A END

1;

