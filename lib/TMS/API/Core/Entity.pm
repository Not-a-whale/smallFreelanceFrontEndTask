package TMS::API::Core::Entity;

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
use TMS::API::Core::EntBusiness;
use TMS::API::Core::EntPerson;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has EntityId    => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has IsActive    => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has DateCreated => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has Notes       => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has PersonId    => (is => 'rw', coerce => 1, isa => 'Undef | EntPersonObj | Int ');
has BusinessId  => (is => 'rw', coerce => 1, isa => 'Undef | EntBusinessObj | Int ');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'IsActive' => {
            'is_null'  => 0,
            'comment'  => 'Boolean',
            'apiclass' => undef,
            'required' => 0,
            'default'  => '1',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'BusinessId' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => 'TMS::API::Core::EntBusiness',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'EntityId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
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
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        },
        'PersonId' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::EntPerson',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

