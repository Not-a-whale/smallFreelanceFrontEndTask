package TMS::API::Core::FinTransaction;

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
use TMS::API::Core::FinClass;
use TMS::API::Core::FinJob;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::FinTransactionType;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has TransactionId   => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has TransactionType => (is => 'rw', coerce => 1, isa => 'FinTransactionTypeObj | Int ');
has RefNumber       => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has JobId           => (is => 'rw', coerce => 1, isa => 'Undef | FinJobObj | Int ');
has CreatedBy       => (is => 'rw', coerce => 1, isa => 'Undef | HrAssociateObj | Int ');
has DateCreated     => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has DateTransaction => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has Status          => (is => 'rw', coerce => 1, isa => 'Undef | EnumValid');
has Class           => (is => 'rw', coerce => 1, isa => 'Undef | FinClassObj | Int ');
has Memo            => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'Memo' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'CreatedBy' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Status' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'enum(\'pending\',\'valid\',\'invalid\')'
        },
        'RefNumber' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(20)'
        },
        'TransactionType' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::FinTransactionType',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'TransactionId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Class' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => 'TMS::API::Core::FinClass',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'JobId' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => 'TMS::API::Core::FinJob',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DateTransaction' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
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

