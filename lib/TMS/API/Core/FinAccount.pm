package TMS::API::Core::FinAccount;

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
use TMS::API::Core::FinAccountType;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has AccountId     => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has AccountTypeId => (is => 'rw', coerce => 1, isa => 'FinAccountTypeObj | Int ');
has ParentId      => (is => 'rw', coerce => 0, isa => 'Undef | FinAccountObj | Int ');
has UserDefined   => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has Code          => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Active        => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has Valid         => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has DateCreated   => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has Name          => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has Description   => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has ExternalName  => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Balance       => (is => 'rw', coerce => 1, isa => 'Undef | Float');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'ParentId' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => 'TMS::API::Core::FinAccount',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Description' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(1024)'
        },
        'AccountTypeId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::FinAccountType',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Balance' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => '0.00',
            'db_type'  => 'decimal(12,2)'
        },
        'Code' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(12)'
        },
        'Active' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => '1',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'AccountId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'ExternalName' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'UserDefined' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => '1',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'Valid' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => '1',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'DateCreated' => {
            'is_null'  => 0,
            'comment'  => '',
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
            'db_type'  => 'varchar(255)'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

