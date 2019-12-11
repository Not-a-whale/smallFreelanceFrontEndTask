package TMS::API::Core::FinTaxId;

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
use TMS::API::Core::Entity;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has EntityId => (is => 'rw', coerce => 1, isa => 'EntityObj | Int ');
has Photo    => (is => 'rw', coerce => 1, isa => 'Undef | GenFileObj | Int ');
has Tax_ID   => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has ID_Type  => (is => 'rw', coerce => 1, isa => 'EnumSsn');
has Entered  => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has Notes    => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Need1099 => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'Need1099' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => '0',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'Entered' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        },
        'ID_Type' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'enum(\'SSN\',\'EIN\',\'ITIN\')'
        },
        'Tax_ID' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'char(16)'
        },
        'Photo' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::GenFile',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'EntityId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => 'TMS::API::Core::Entity',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Notes' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'text'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

