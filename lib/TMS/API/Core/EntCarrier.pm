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

use TMS::API::Core::EntBusiness;
use TMS::API::Core::GenFile;

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

has CarrierId            => (is => 'rw', coerce => 1, isa => 'EntBusinessObj | Int ');
has MC                   => (is => 'rw', coerce => 1, isa => 'Undef | MCnum');
has McCertificatePhoto   => (is => 'rw', coerce => 1, isa => 'Undef | GenFileObj | Int ');
has DOT                  => (is => 'rw', coerce => 1, isa => 'Undef | DOTnum');
has CrType               => (is => 'rw', coerce => 1, isa => 'Undef | EnumCompanyCarrier');
has SCAC                 => (is => 'rw', coerce => 1, isa => 'Undef | SCAC');
has RateConfEmailAddress => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');

1;
