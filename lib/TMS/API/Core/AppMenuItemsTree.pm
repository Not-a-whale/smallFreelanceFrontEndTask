package TMS::API::Core::AppMenuItemsTree;

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
use TMS::API::Core::AppMenuItem;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has AncestorId   => (is => 'rw', coerce => 1, isa => 'AppMenuItemObj | Int ');
has DescendantId => (is => 'rw', coerce => 1, isa => 'AppMenuItemObj | Int ');
has Depth        => (is => 'rw', coerce => 0, isa => 'Int');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'AncestorId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::AppMenuItem',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Depth' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'DescendantId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::AppMenuItem',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

