package TMS::API::Core::DspLoad;

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
use TMS::API::Core::EntShipper;
use TMS::API::Core::FinJob;
use TMS::API::Core::EntCustomer;
use TMS::API::Core::InvTrailerType;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has LoadId         => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has CreatedBy      => (is => 'rw', coerce => 1, isa => 'HrAssociateObj | Int ');
has BrokerId       => (is => 'rw', coerce => 1, isa => 'EntCustomerObj | Int ');
has ShipperId      => (is => 'rw', coerce => 1, isa => 'Undef | EntShipperObj | Int ');
has BookedBy       => (is => 'rw', coerce => 1, isa => 'Undef | HrAssociateObj | Int ');
has DateCreated    => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has DateBooked     => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has LoadNumber     => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has ProNumber      => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has LoadType       => (is => 'rw', coerce => 1, isa => 'Undef | EnumFtl');
has TruckType      => (is => 'rw', coerce => 1, isa => 'Undef | InvTrailerTypeObj | Int ');
has ReeferTempLow  => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has ReeferTempHigh => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has Precooling     => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has TempMode       => (is => 'rw', coerce => 1, isa => 'Undef | EnumContinuous');
has TeamRequired   => (is => 'rw', coerce => 1, isa => 'Undef | EnumYes');
has DispatchNote   => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Job            => (is => 'rw', coerce => 1, isa => 'Undef | FinJobObj | Int ');
has GoogleRoute    => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Status         => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has LoadRate       => (is => 'rw', coerce => 1, isa => 'Float');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'Precooling' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'decimal(5,2)'
        },
        'CreatedBy' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'BrokerId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::EntCustomer',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'LoadType' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'enum(\'FTL\',\'LTL\',\'Partial\')'
        },
        'GoogleRoute' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'ReeferTempHigh' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'decimal(5,2)'
        },
        'LoadId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'BookedBy' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'TeamRequired' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'enum(\'yes\',\'no\')'
        },
        'DispatchNote' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'TruckType' => {
            'is_null' => 1,
            'comment' =>
                'This is technically the trailer type for the load but will be called TruckType due to nomenclature used in office',
            'required' => 0,
            'apiclass' => 'TMS::API::Core::InvTrailerType',
            'default'  => undef,
            'db_type'  => 'varchar(24)'
        },
        'Job' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::FinJob',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'LoadRate' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'decimal(12,2)'
        },
        'LoadNumber' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(64)'
        },
        'Status' => {
            'comment'  => 'Internal status for load, cancelled, tonu, etc.',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(45)'
        },
        'ShipperId' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::EntShipper',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DateBooked' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'ProNumber' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(16)'
        },
        'ReeferTempLow' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'decimal(5,2)'
        },
        'TempMode' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'enum(\'continuous\',\'start/stop\')'
        },
        'DateCreated' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

