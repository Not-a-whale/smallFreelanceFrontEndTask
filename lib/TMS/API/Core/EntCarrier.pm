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
use TMS::API::Core::CntState;
use TMS::API::Core::GenFile;
use TMS::API::Core::EntBusiness;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has CarrierId          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntBusinessObj',);
has MC                 => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has McCertificatePhoto => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'GenFileObj',);
has DOT                => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has CrType             => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'EnumCompanyCarrier',);
has IFTA_Acc           => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has IFTA_State         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'CntStateObj',);
has SCAC               => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has state_OR           => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has state_NY           => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has state_NC           => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has state_SC           => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has state_NM           => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has state_KY           => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has state_FL           => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);

# AUTO-GENERATED HAS-A END

1;

