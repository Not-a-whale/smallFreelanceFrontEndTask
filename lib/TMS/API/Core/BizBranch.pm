package TMS::API::Core::BizBranch;

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
use TMS::API::Core::EntBusiness;
use TMS::API::Core::CntAddress;
use TMS::API::Core::CntPhonesfax;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has BrnchId      => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has OfficeName   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has BizId        => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EntBusinessObj',);
has BrnchAddress => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'CntAddressObj',);
has BrnchPhone   => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'CntPhonesfaxObj',);
has BrnchFax     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'CntPhonesfaxObj',);
has BrnchEMail   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);

# AUTO-GENERATED HAS-A END

1;

