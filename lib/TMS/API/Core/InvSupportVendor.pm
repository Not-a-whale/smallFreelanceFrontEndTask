package TMS::API::Core::InvSupportVendor;

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
has SupportId      => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has VendorId       => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'BizBranchObj | Int ',);
has PrimaryContact => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'HrAssociateObj | Int ',);
has Name           => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has Description    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);

# AUTO-GENERATED HAS-A END

1;

