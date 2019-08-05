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
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has EntityId => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntityObj',);
has Photo    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'GenFileObj',);
has Tax_ID   => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has ID_Type  => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumSsn',);
has Entered  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Notes    => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Need1099 => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);

# AUTO-GENERATED HAS-A END

1;

