package TMS::API::Core::MsgNote;

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
use TMS::API::Core::MsgAccess;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has mnoteid     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has subject     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has body        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has posted      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has author      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj | Int ',);
has sourcetable => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has sourceid    => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Int',);
has macsid      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'MsgAccessObj | Int ',);
has keywords    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);

# AUTO-GENERATED HAS-A END

1;
