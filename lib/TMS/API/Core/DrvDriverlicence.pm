package TMS::API::Core::DrvDriverlicence;

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
use TMS::API::Core::DrvCdlEndorsement;
use TMS::API::Core::GenFile;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has DrLcId          => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has DriverId        => (is => 'rw', coerce => 1, isa => 'DrvDriverObj | Int ');
has DrLicNumber     => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has DrLcDateValid   => (is => 'rw', coerce => 1, isa => 'DATE');
has DrLcDateExpired => (is => 'rw', coerce => 1, isa => 'DATE');
has DrLcSate        => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has DrLcEndorsement => (is => 'rw', coerce => 1, isa => 'Undef | DrvCdlEndorsementObj | Int ');
has Photo           => (is => 'rw', coerce => 1, isa => 'GenFileObj | Int ');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'DriverId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::DrvDriver',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DrLcDateValid' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'date'
        },
        'DrLcEndorsement' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => 'TMS::API::Core::DrvCdlEndorsement',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DrLcSate' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'char(2)'
        },
        'DrLcId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Photo' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::GenFile',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DrLicNumber' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'DrLcDateExpired' => {
            'comment'  => '',
            'is_null'  => 0,
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

