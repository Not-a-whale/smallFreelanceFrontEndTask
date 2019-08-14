package TMS::API::Core::InvEquipment;

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
use TMS::API::Core::BizBranch;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has EquipmentId    => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has GeneralName    => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has OwnerId        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj',);
has VendorId       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BizBranchObj',);
has DatePurchased  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATE',);
has DateSold       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATE',);
has PricePurchased => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has PriceSold      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has SerialNo       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);

# AUTO-GENERATED HAS-A END

1;

