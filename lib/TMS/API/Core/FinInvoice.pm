package TMS::API::Core::FinInvoice;

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
use TMS::API::Core::Entity;
use TMS::API::Core::FinPaymentTerm;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InvoiceId      => (is => 'rw', coerce => 0, isa => 'PrimaryKeyInt');
has EntityId       => (is => 'rw', coerce => 1, isa => 'EntityObj | Int ');
has PaymentTermsId => (is => 'rw', coerce => 1, isa => 'FinPaymentTermObj | Int ');
has DateCreated    => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has RefNumber      => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Notes          => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Comments       => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has PONumber       => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Status         => (is => 'rw', coerce => 1, isa => 'Undef | EnumInvalid');
has DateInvoiced   => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has FactoredParent => (is => 'rw', coerce => 0, isa => 'Undef | FinInvoiceObj | Int ');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'PaymentTermsId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::FinPaymentTerm',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'PONumber' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(32)'
        },
        'Comments' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'InvoiceId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Status' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'pending',
            'db_type'  => 'enum(\'invalid\',\'pending\',\'invoiced\',\'paid\')'
        },
        'FactoredParent' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => 'TMS::API::Core::FinInvoice',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'RefNumber' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(20)'
        },
        'DateInvoiced' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'EntityId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::Entity',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Notes' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
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
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

