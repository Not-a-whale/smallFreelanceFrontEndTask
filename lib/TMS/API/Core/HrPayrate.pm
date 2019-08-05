package TMS::API::Core::HrPayrate;

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

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has PayRateId      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has AstId          => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj',);
has RateType       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'EnumHourly',);
has RateAmount     => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'Float',);
has Agreement      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'GenFileObj',);
has EffectiveDate  => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);
has ExpirationDate => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);

# AUTO-GENERATED HAS-A END

1;
