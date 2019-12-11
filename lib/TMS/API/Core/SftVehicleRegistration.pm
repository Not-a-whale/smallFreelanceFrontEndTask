package TMS::API::Core::SftVehicleRegistration;

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
use TMS::API::Core::GenFile;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has RegistrationId   => (is => 'rw', coerce => 0, isa => 'PrimaryKeyInt');
has VehicleId        => (is => 'rw', coerce => 1, isa => 'InvVehicleObj | Int ');
has PlateNumber      => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has State            => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has RegistrationCard => (is => 'rw', coerce => 1, isa => 'GenFileObj | Int ');
has RegistrationDate => (is => 'rw', coerce => 1, isa => 'DATETIME');
has DateExpiration   => (is => 'rw', coerce => 1, isa => 'DATETIME');
has ProRate          => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'RegistrationId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'PlateNumber' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'varchar(16)'
        },
        'VehicleId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::InvVehicle',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'RegistrationCard' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::GenFile',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'ProRate' => {
            'is_null'  => 0,
            'comment'  => 'vehicle has international tag',
            'apiclass' => undef,
            'required' => 0,
            'default'  => '0',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'RegistrationDate' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'DateExpiration' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'State' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(2)'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

