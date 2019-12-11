package TMS::API::Core::FinItemTemplate;

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
use TMS::API::Core::FinTransactionType;
use TMS::API::Core::FinAccount;
use TMS::API::Core::FinItemTemplatesType;
use TMS::API::Core::Entity;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has ItemTemplateId  => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has TemplateTypeId  => (is => 'rw', coerce => 1, isa => 'FinItemTemplatesTypeObj | Int ');
has EntityId        => (is => 'rw', coerce => 1, isa => 'Undef | EntityObj | Int ');
has DebitAccountId  => (is => 'rw', coerce => 1, isa => 'Undef | FinAccountObj | Int ');
has CreditAccountId => (is => 'rw', coerce => 1, isa => 'Undef | FinAccountObj | Int ');
has CreatedBy       => (is => 'rw', coerce => 1, isa => 'Undef | HrAssociateObj | Int ');
has ParentId        => (is => 'rw', coerce => 0, isa => 'Undef | FinItemTemplateObj | Int ');
has DateCreated     => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has Price           => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has UserDefined     => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has PriceType       => (is => 'rw', coerce => 1, isa => 'Undef | EnumFlatRate');
has Name            => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has Description     => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Deleted         => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has DeletedBy       => (is => 'rw', coerce => 1, isa => 'Undef | HrAssociateObj | Int ');
has DateDeleted     => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has UpdatedBy       => (is => 'rw', coerce => 1, isa => 'Undef | HrAssociateObj | Int ');
has DateUpdated     => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has TransactionType => (is => 'rw', coerce => 1, isa => 'Undef | FinTransactionTypeObj | Int ');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'ParentId' => {
            'comment'  => 'For AFTER INSERT trigger functionality',
            'is_null'  => 1,
            'apiclass' => 'TMS::API::Core::FinItemTemplate',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'CreatedBy' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Description' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'PriceType' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'enum(\'flat rate\',\'percentage\')'
        },
        'Deleted' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => '0',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'CreditAccountId' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => 'TMS::API::Core::FinAccount',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'TransactionType' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::FinTransactionType',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DebitAccountId' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => 'TMS::API::Core::FinAccount',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'ItemTemplateId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DateDeleted' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'DateUpdated' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'UpdatedBy' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Price' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'decimal(12,2) unsigned'
        },
        'UserDefined' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => '1',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'TemplateTypeId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::FinItemTemplatesType',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DeletedBy' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'EntityId' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => 'TMS::API::Core::Entity',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DateCreated' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        },
        'Name' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(1024)'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

