package TMS::API::Core::FinScheduledDeduction;

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
use TMS::API::Core::FinItemTemplate;
use TMS::API::Core::Entity;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has SchedDeductionId => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has ItemTemplateId   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'FinItemTemplateObj | Int ',);
has EntityId         => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntityObj | Int ',);
has DateStart        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);
has DateStop         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATE',);
has PaymentAmount    => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'Float',);
has CumulativeAmount => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has TotalAmount      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has Comments         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has ScheduleType     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumLoan',);
has Period           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumNull',);
has PeriodDay        => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Valid            => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);
has CreatedBy        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj | Int ',);
has DateCreated      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);

# AUTO-GENERATED HAS-A END

1;

