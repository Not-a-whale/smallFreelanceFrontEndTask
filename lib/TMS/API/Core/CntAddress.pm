package TMS::API::Core::CntAddress;

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
has AddrId  => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has Street1 => (is => 'rw', coerce => 1, isa => 'Street');
has Street2 => (is => 'rw', coerce => 1, isa => 'Undef | Street');
has Street3 => (is => 'rw', coerce => 1, isa => 'Undef | Street');
has City    => (is => 'rw', coerce => 1, isa => 'City');
has State   => (is => 'rw', coerce => 1, isa => 'SupportedStateAbbr');
has Zip     => (is => 'rw', coerce => 1, isa => 'ZipCanadaUSA');
has Country => (is => 'rw', coerce => 1, isa => 'Undef | SupportedCountryName');
has GpsLng  => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has GpsLat  => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has Notes   => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'GpsLng' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'double'
        },
        'Zip' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'char(11)'
        },
        'GpsLat' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'double'
        },
        'City' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(64)'
        },
        'Street3' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => '',
            'db_type'  => 'varchar(64)'
        },
        'Country' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'USA',
            'db_type'  => 'varchar(255)'
        },
        'Street2' => {
            'comment'  => 'Street',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => '',
            'db_type'  => 'varchar(64)'
        },
        'AddrId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Street1' => {
            'is_null'  => 0,
            'comment'  => 'Street or P.O. Box',
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'varchar(64)'
        },
        'State' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'char(2)'
        },
        'Notes' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'text'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

