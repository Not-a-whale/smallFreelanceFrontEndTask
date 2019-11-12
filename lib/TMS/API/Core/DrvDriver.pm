package TMS::API::Core::DrvDriver;

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

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
<<<<<<< HEAD
has DriverId            => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'HrAssociateObj | Int ',);
=======
has DriverId            => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj | Int ',);
>>>>>>> d8b237c0a271ea8cabf70fd6a1180c53f82a77e0
has LocalRoutes         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);
has InternationalRoutes => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);
has LastAnnualReview    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATE',);
has PullNotice          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATE',);

# AUTO-GENERATED HAS-A END

1;

