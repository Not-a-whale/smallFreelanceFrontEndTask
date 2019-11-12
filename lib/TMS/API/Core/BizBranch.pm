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
use TMS::API::Core::CntPhonesfax;
<<<<<<< HEAD
use TMS::API::Core::EntBusiness;
use TMS::API::Core::CntAddress;
=======
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntBusiness;
>>>>>>> d8b237c0a271ea8cabf70fd6a1180c53f82a77e0

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has BrnchId      => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
<<<<<<< HEAD
has OfficeName   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'UpperCaseStr',);
=======
has OfficeName   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
>>>>>>> d8b237c0a271ea8cabf70fd6a1180c53f82a77e0
has BizId        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntBusinessObj | Int ',);
has BrnchAddress => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'CntAddressObj | Int ',);
has BrnchPhone   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'CntPhonesfaxObj | Int ',);
has BrnchFax     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'CntPhonesfaxObj | Int ',);
<<<<<<< HEAD
has BrnchEMail   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Email',);
=======
has BrnchEMail   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
>>>>>>> d8b237c0a271ea8cabf70fd6a1180c53f82a77e0

# AUTO-GENERATED HAS-A END

1;

