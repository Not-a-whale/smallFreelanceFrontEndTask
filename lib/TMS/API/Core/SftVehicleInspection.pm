package TMS::API::Core::SftVehicleInspection;

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
use TMS::API::Core::SftInspectionSchedule;
use TMS::API::Core::CntAddress;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InspectionId         => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has InspectionScheduleId => (is => 'rw', coerce => 1, isa => 'SftInspectionScheduleObj | Int ');
has InspectorId          => (is => 'rw', coerce => 1, isa => 'HrAssociateObj | Int ');
has InspectorSignatureId => (is => 'rw', coerce => 1, isa => 'GenFileObj | Int ');
has LocationOfRecords    => (is => 'rw', coerce => 1, isa => 'CntAddressObj | Int ');
has InspectionNumber     => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has DateInspection       => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has Status               => (is => 'rw', coerce => 1, isa => 'Undef | EnumPassed');
has Remarks              => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Mileage              => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'LocationOfRecords' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::CntAddress',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'InspectorSignatureId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::GenFile',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Status' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'Other',
            'db_type'  => 'enum(\'Passed\',\'Failed\',\'Postponed\',\'Other\')'
        },
        'InspectionNumber' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'varchar(10)'
        },
        'DateInspection' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        },
        'InspectorId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Remarks' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'InspectionId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Mileage' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(12)'
        },
        'InspectionScheduleId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::SftInspectionSchedule',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

