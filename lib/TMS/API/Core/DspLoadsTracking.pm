package TMS::API::Core::DspLoadsTracking;

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
use TMS::API::Core::DrvDriver;
use TMS::API::Core::DspLoadsDestination;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has DestinationId => (is => 'rw', coerce => 1, isa => 'DspLoadsDestinationObj | Int ');
has DriverId      => (is => 'rw', coerce => 1, isa => 'DrvDriverObj | Int ');
has DateArrived   => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has DateDeparted  => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has Pallets       => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has Weight        => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has Pieces        => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has BolPod        => (is => 'rw', coerce => 1, isa => 'Undef | EnumNo');
has BolPodNumber  => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has SealNumber    => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Notes         => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has ReeferTemp    => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has Status        => (is => 'rw', coerce => 1, isa => 'TidySpacesString');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'BolPodNumber' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'Weight' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'float'
        },
        'DestinationId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => 'TMS::API::Core::DspLoadsDestination',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'BolPod' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'na',
            'db_type'  => 'enum(\'yes\',\'no\',\'na\')'
        },
        'Pallets' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'int(11)'
        },
        'Pieces' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'int(11)'
        },
        'DriverId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::DrvDriver',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DateArrived' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'Status' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(64)'
        },
        'SealNumber' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'DateDeparted' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'ReeferTemp' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'decimal(5,2)'
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

