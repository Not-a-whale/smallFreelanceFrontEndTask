package TMS::API::Core::HrReference;

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

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has ReferenceId     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has ReferenceFor    => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj',);
has ReferensorName  => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has ReferensorPhone => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'CntPhonesfaxObj',);
has ReceivedBy      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj',);
has ReceivedDate    => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);
has ReferenceNotes  => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);

# AUTO-GENERATED HAS-A END

1;

