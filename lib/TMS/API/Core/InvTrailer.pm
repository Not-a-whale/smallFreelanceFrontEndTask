package TMS::API::Core::InvTrailer;

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
use TMS::API::Core::InvVehicle;
use TMS::API::Core::InvTrailerType;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has TrailerId     => (is => 'rw', coerce => 1, isa => 'InvVehicleObj | Int ');
has Type          => (is => 'rw', coerce => 1, isa => 'Undef | InvTrailerTypeObj | Int ');
has HazMat        => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has LoadLength    => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has LoadWidth     => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has LoadHeight    => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has DoorWidth     => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has DoorHeight    => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has LoadCapactiy  => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has HasLiftGate   => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has HasPalletJack => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has HasRamps      => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has LoadVolume    => (is => 'rw', coerce => 0, isa => 'Undef | Int');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'DoorHeight' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'LoadWidth' => {
            'is_null'  => 1,
            'comment'  => 'In inches',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'HazMat' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => '0',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'LoadLength' => {
            'comment'  => 'In inches',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'HasPalletJack' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => '0',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'LoadHeight' => {
            'is_null' => 1,
            'comment' => 'In inches
',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'HasLiftGate' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => '0',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'TrailerId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => 'TMS::API::Core::InvVehicle',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DoorWidth' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'Type' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::InvTrailerType',
            'required' => 0,
            'default'  => 'Van',
            'db_type'  => 'varchar(24)'
        },
        'LoadVolume' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'int(11)'
        },
        'HasRamps' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => '0',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'LoadCapactiy' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

