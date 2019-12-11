package TMS::API::Core::HrGovidcard;

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
use TMS::API::Core::GenFile;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has CardId          => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has AstId           => (is => 'rw', coerce => 1, isa => 'HrAssociateObj | Int ');
has CardNumber      => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has CardDateExpired => (is => 'rw', coerce => 1, isa => 'DATE');
has CardDateValid   => (is => 'rw', coerce => 1, isa => 'DATE');
has CardSate        => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has CardType        => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has Photo           => (is => 'rw', coerce => 1, isa => 'Undef | GenFileObj | Int ');
has AddedBy         => (is => 'rw', coerce => 1, isa => 'HrAssociateObj | Int ');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'CardDateValid' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'date'
        },
        'CardNumber' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'CardType' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'AddedBy' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'CardSate' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'char(2)'
        },
        'AstId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'CardId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Photo' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::GenFile',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'CardDateExpired' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'date'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

