package TMS::API::Core::FinBillingInfo;

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
use TMS::API::Core::CntAddress;
use TMS::API::Core::FinBillingTag;
use TMS::API::Core::Entity;
use TMS::API::Core::CntPhonesfax;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has BillingId       => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has EntityId        => (is => 'rw', coerce => 1, isa => 'EntityObj | Int ');
has PayToTheOrderOf => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has ContactName     => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Phone           => (is => 'rw', coerce => 1, isa => 'CntPhonesfaxObj | Int ');
has Fax             => (is => 'rw', coerce => 1, isa => 'Undef | CntPhonesfaxObj | Int ');
has Address         => (is => 'rw', coerce => 1, isa => 'CntAddressObj | Int ');
has EMail           => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has BillingTagId    => (is => 'rw', coerce => 1, isa => 'FinBillingTagObj | Int ');
has DateIn          => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has DateOut         => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has CreditLimit     => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has CreditHold      => (is => 'rw', coerce => 1, isa => 'Undef | EnumYes');
has Notes           => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'Fax' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => 'TMS::API::Core::CntPhonesfax',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'BillingTagId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::FinBillingTag',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'PayToTheOrderOf' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'DateOut' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'BillingId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DateIn' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        },
        'CreditLimit' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'decimal(10,2)'
        },
        'Address' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::CntAddress',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Phone' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::CntPhonesfax',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'CreditHold' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'enum(\'yes\',\'no\')'
        },
        'ContactName' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'EMail' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'Notes' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'EntityId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::Entity',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

