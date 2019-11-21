package TMS::API::Core::HrResidence;

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
use TMS::API::Core::HrAssociate;
use TMS::API::Core::CntAddress;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has ResdenceId   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has AstId        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj | Int ',);
has ResAddress   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'CntAddressObj | Int ',);
has ResPhone     => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'CntPhonesfaxObj | Int ',);
has DateMovedIn  => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);
has DateMovedOut => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATE',);

# AUTO-GENERATED HAS-A END

1;

