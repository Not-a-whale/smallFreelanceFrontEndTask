package TMS::API::Core::FinAccountType;

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
has AccountTypeId => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has Name          => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has ParentId      => (is => 'rw', coerce => 0, isa => 'Undef | FinAccountTypeObj | Int ');
has Editable      => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has Valid         => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has UserDefined   => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has Debit         => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has Credit        => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has Temp          => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has DisplayOrder  => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has BalanceSheet  => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has IncomeSheet   => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'ParentId' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::FinAccountType',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'AccountTypeId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'IncomeSheet' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => '0',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'Credit' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => '-1.00',
            'db_type'  => 'decimal(12,2)'
        },
        'DisplayOrder' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'int(11)'
        },
        'Editable' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => '1',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'BalanceSheet' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => '1',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'UserDefined' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => '1',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'Debit' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => '1.00',
            'db_type'  => 'decimal(12,2)'
        },
        'Valid' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => '0',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'Temp' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => '0',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'Name' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

