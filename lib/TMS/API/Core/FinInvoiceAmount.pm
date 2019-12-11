package TMS::API::Core::FinInvoiceAmount;

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
# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InvoiceId      => (is => 'rw', coerce => 0, isa => 'Int');
has EntityId       => (is => 'rw', coerce => 0, isa => 'Int');
has PaymentTermsId => (is => 'rw', coerce => 0, isa => 'Int');
has DateCreated    => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has RefNumber      => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Notes          => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Comments       => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has PONumber       => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Status         => (is => 'rw', coerce => 1, isa => 'Undef | EnumInvalid');
has DateInvoiced   => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has FactoredParent => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has Amount         => (is => 'rw', coerce => 1, isa => 'Undef | Float');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'PaymentTermsId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'PONumber' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(32)'
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
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Status' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'pending',
            'db_type'  => 'enum(\'invalid\',\'pending\',\'invoiced\',\'paid\')'
        },
        'RefNumber' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(20)'
        },
        'FactoredParent' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DateInvoiced' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'DateCreated' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => '0000-00-00 00:00:00',
            'db_type'  => 'datetime'
        },
        'Notes' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'EntityId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Amount' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'decimal(34,2)'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

