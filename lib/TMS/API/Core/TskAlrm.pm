package TMS::API::Core::TskAlrm;

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

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has alrmid    => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has tskid     => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'TskTaskObj',);
has message   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has atcrontab => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has periodic  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'ENUM',);
has repeat    => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has turnoff   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);

# AUTO-GENERATED HAS-A END

1;

