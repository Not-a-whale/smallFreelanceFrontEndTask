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
use TMS::API::Core::FinAccount;
use TMS::API::Core::Entity;
use TMS::API::Core::FinTransaction;
use TMS::API::Core::FinJob;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has JrlEntryId     => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has TransactionId  => (is => 'rw', coerce => 1, isa => 'FinTransactionObj | Int ');
has AccountId      => (is => 'rw', coerce => 1, isa => 'FinAccountObj | Int ');
has EntityId       => (is => 'rw', coerce => 1, isa => 'EntityObj | Int ');
has CreatedBy      => (is => 'rw', coerce => 1, isa => 'Undef | HrAssociateObj | Int ');
has DateCreated    => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has DebitCredit    => (is => 'rw', coerce => 1, isa => 'Undef | EnumDebit');
has Amount         => (is => 'rw', coerce => 1, isa => 'Float');
has Classification => (is => 'rw', coerce => 1, isa => 'Undef | EnumCustomer');
has JobId          => (is => 'rw', coerce => 1, isa => 'Undef | FinJobObj | Int ');
has VendorAmount   => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has ReportAmount   => (is => 'rw', coerce => 1, isa => 'Undef | Float');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'CreatedBy' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'JobId' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => 'TMS::API::Core::FinJob',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Classification' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'customer',
            'db_type'  => 'enum(\'customer\',\'vendor\')'
        },
        'AccountId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::FinAccount',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'ReportAmount' => {
            'is_null'  => 1,
            'comment'  => 'The amount to show on reports.',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'decimal(12,2)'
        },
        'TransactionId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::FinTransaction',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DebitCredit' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'debit',
            'db_type'  => 'enum(\'debit\',\'credit\')'
        },
        'EntityId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::Entity',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DateCreated' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        },
        'Amount' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'decimal(12,2)'
        },
        'JrlEntryId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'VendorAmount' => {
            'comment'  => 'The amount to show for customer invoices',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'decimal(12,2)'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

