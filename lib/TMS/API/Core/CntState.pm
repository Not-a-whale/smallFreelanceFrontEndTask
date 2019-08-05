package TMS::API::Core::CntState;

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

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has StateId   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has ShortName => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has FullName  => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has Country   => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);

# AUTO-GENERATED HAS-A END

1;

