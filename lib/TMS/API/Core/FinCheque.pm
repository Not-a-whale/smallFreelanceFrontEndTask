package TMS::API::Core::FinCheque;

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
use TMS::API::Core::Entity;
use TMS::API::Core::BizBranch;
use TMS::API::Core::FinTransaction;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has ChequeId           => (is => 'rw', coerce => 0, isa => 'PrimaryKeyInt');
has ChequeNumber       => (is => 'rw', coerce => 0, isa => 'Int');
has TransactionId      => (is => 'rw', coerce => 1, isa => 'FinTransactionObj | Int ');
has CreatedBy          => (is => 'rw', coerce => 1, isa => 'HrAssociateObj | Int ');
has AuthorizedBy       => (is => 'rw', coerce => 1, isa => 'Undef | HrAssociateObj | Int ');
has VoidedBy           => (is => 'rw', coerce => 1, isa => 'Undef | HrAssociateObj | Int ');
has Payer              => (is => 'rw', coerce => 1, isa => 'EntityObj | Int ');
has Payee              => (is => 'rw', coerce => 1, isa => 'EntityObj | Int ');
has Bank               => (is => 'rw', coerce => 1, isa => 'BizBranchObj | Int ');
has Amount             => (is => 'rw', coerce => 1, isa => 'Float');
has Memo               => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has PayerName          => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has PayerStreetAddress => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has PayerCityAddress   => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has PayerPhone         => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has PayeeName          => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has PayeeStreetAddress => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has PayeeCityAddress   => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has PayeePhone         => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has BankName           => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has BankStreetAddress  => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has BankCityAddress    => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has BankPhone          => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has BankRoutingNumber  => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has BankAccountNumber  => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has DateCreated        => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has DateVoided         => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has DateAuthorized     => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'DateVoided' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'BankAccountNumber' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'ChequeId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'PayeeName' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'BankRoutingNumber' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'BankStreetAddress' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'PayerCityAddress' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'AuthorizedBy' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'TransactionId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::FinTransaction',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'PayeeStreetAddress' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'Payee' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::Entity',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Bank' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::BizBranch',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'PayerPhone' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(15)'
        },
        'ChequeNumber' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'DateCreated' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        },
        'BankName' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'Memo' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'CreatedBy' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'PayerName' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'DateAuthorized' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'PayeeCityAddress' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'BankPhone' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(15)'
        },
        'PayerStreetAddress' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'Payer' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::Entity',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'PayeePhone' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(15)'
        },
        'BankCityAddress' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'VoidedBy' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
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

