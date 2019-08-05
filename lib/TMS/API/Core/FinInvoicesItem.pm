package TMS::API::Core::FinInvoicesItem;

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
use TMS::API::Core::Job;
use TMS::API::Core::FinItemTemplate;
use TMS::API::Core::FinJournalEntry;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::FinInvoice;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InvoiceItemId        => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has InvoiceId            => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'FinInvoiceObj',);
has ItemTemplateId       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'FinItemTemplateObj',);
has Amount               => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has Quantity             => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has CreatedBy            => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'HrAssociateObj',);
has DateCreated          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Notes                => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Comments             => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has CreditJournalEntryId => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'FinJournalEntryObj',);
has DebitJournalEntryId  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'FinJournalEntryObj',);
has JobId                => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'JobObj',);

# AUTO-GENERATED HAS-A END

1;

