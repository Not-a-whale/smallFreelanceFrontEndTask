package TMS::API::Core::EntCarrier;

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
use TMS::API::Core::EntBusiness;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has CarrierId          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntBusinessObj | Int ',);
has MC                 => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'MCnum',);
has McCertificatePhoto => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'GenFileObj | Int ',);
has DOT                => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DOTnum',);
has CrType             => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumCompanyCarrier',);
has IFTA_Acc           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has IFTA_State         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'SupportedStateAbbr',);
has SCAC               => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'SCAC',);
has state_OR           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has state_NY           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has state_NC           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has state_SC           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has state_NM           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has state_KY           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has state_FL           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);

# AUTO-GENERATED HAS-A END

1;

