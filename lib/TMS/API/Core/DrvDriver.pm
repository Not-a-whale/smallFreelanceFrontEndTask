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
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has DriverId            => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj',);
has LocalRoutes         => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);
has InternationalRoutes => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);
has LastAnnualReview    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATE',);
has PullNotice          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATE',);

# AUTO-GENERATED HAS-A END

1;

