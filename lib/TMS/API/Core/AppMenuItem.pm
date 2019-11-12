package TMS::API::Core::AppMenuItem;

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
has MenuItemId => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has ParentId   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'AppMenuItemObj | Int ',);
has Label      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has Title      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Icon       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Route      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Help       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has SortIndex  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has Enabled    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);
has Target     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);

# AUTO-GENERATED HAS-A END

1;

