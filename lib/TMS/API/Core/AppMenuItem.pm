package TMS::API::Core::AppMenuItem;

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
has MenuItemId => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has ParentId   => (is => 'rw', coerce => 0, isa => 'Undef | AppMenuItemObj | Int ');
has Label      => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has Title      => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Icon       => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Route      => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Help       => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has SortIndex  => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has Enabled    => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has Target     => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'Target' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(64)'
        },
        'Icon' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(1024)'
        },
        'Route' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'tms.app.error',
            'db_type'  => 'varchar(1024)'
        },
        'ParentId' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => 'TMS::API::Core::AppMenuItem',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Label' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'varchar(32)'
        },
        'Help' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'MenuItemId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Enabled' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => '1',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'SortIndex' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => '0.000',
            'db_type'  => 'decimal(6,3)'
        },
        'Title' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(1024)'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

