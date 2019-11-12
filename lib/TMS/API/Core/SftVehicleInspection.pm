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
use TMS::API::Core::HrAssociate;
use TMS::API::Core::SftInspectionSchedule;
use TMS::API::Core::GenFile;
use TMS::API::Core::CntAddress;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InspectionId         => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has InspectionScheduleId => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'SftInspectionScheduleObj | Int ',);
has InspectorId          => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj | Int ',);
has InspectorSignatureId => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'GenFileObj | Int ',);
has LocationOfRecords    => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'CntAddressObj | Int ',);
has InspectionNumber     => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has DateInspection       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Status               => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumPassed',);
has Remarks              => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Mileage              => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);

# AUTO-GENERATED HAS-A END

1;

