package TMS::API::Core::FinInvoicePayment;

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
use TMS::API::Core::FinTransaction;
use TMS::API::Core::FinInvoice;
use TMS::API::Core::FinPaymentMethod;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::Entity;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InvoicePaymentId => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has InvoiceId        => (is => 'rw', coerce => 1, isa => 'FinInvoiceObj | Int ');
has TransactionId    => (is => 'rw', coerce => 1, isa => 'FinTransactionObj | Int ');
has PaymentMethodId  => (is => 'rw', coerce => 1, isa => 'FinPaymentMethodObj | Int ');
has PayerId          => (is => 'rw', coerce => 1, isa => 'EntityObj | Int ');
has CreatedBy        => (is => 'rw', coerce => 1, isa => 'Undef | HrAssociateObj | Int ');
has Amount           => (is => 'rw', coerce => 1, isa => 'Float');
has DateCreated      => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has DatePayment      => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has Valid            => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'DatePayment' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        },
        'InvoicePaymentId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'InvoiceId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::FinInvoice',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'CreatedBy' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'PaymentMethodId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::FinPaymentMethod',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Valid' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => '1',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'TransactionId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::FinTransaction',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'PayerId' => {
            'is_null'  => 0,
            'comment'  => '',
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
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'decimal(12,2) unsigned'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

