package TMS::API::Core::HrGovidcard;

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
use TMS::API::Core::CntState;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has CardId          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has AstId           => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj',);
has CardNumber      => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has CardDateExpired => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);
has CardDateValid   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);
has CardSate        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'CntStateObj',);
has CardType        => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);

# AUTO-GENERATED HAS-A END

1;

