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
use TMS::API::Core::HrAssociate;
use TMS::API::Core::FinInvoice;
use TMS::API::Core::FinItemTemplate;
use TMS::API::Core::FinJournalEntry;
use TMS::API::Core::FinJob;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InvoiceItemId        => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has InvoiceId            => (is => 'rw', coerce => 1, isa => 'Undef | FinInvoiceObj | Int ');
has ItemTemplateId       => (is => 'rw', coerce => 1, isa => 'Undef | FinItemTemplateObj | Int ');
has Amount               => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has Quantity             => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has CreatedBy            => (is => 'rw', coerce => 1, isa => 'Undef | HrAssociateObj | Int ');
has DateCreated          => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has Notes                => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Comments             => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has CreditJournalEntryId => (is => 'rw', coerce => 1, isa => 'Undef | FinJournalEntryObj | Int ');
has DebitJournalEntryId  => (is => 'rw', coerce => 1, isa => 'Undef | FinJournalEntryObj | Int ');
has JobId                => (is => 'rw', coerce => 1, isa => 'FinJobObj | Int ');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'CreatedBy' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Quantity' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => '1',
            'db_type'  => 'bigint(20) unsigned'
        },
        'CreditJournalEntryId' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::FinJournalEntry',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'JobId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::FinJob',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'ItemTemplateId' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => 'TMS::API::Core::FinItemTemplate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'InvoiceItemId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Comments' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'InvoiceId' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::FinInvoice',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DebitJournalEntryId' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => 'TMS::API::Core::FinJournalEntry',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Notes' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'DateCreated' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        },
        'Amount' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'decimal(12,2)'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

