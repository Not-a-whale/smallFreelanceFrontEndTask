package TMS::API::Core::FinTaxId;

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
use TMS::API::Core::Entity;
use TMS::API::Core::GenFile;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has EntityId => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntityObj | Int ',);
has Photo    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'GenFileObj | Int ',);
has Tax_ID   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has ID_Type  => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EnumSsn',);
has Entered  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Notes    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Need1099 => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);

# AUTO-GENERATED HAS-A END

1;

