package TMS::API::Core::TskTask;

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
use TMS::API::Core::TskTask;
use TMS::API::Core::EntPerson;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has tskid     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has prjid     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'TskTaskObj',);
has PrsnId    => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EntPersonObj',);
has name      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has created   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has startdate => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has duedate   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has completed => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has estimated => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has priority  => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has severity  => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);

# AUTO-GENERATED HAS-A END

1;

