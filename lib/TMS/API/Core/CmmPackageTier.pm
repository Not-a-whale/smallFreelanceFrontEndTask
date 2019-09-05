package TMS::API::Core::CmmPackageTier;

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
use TMS::API::Core::CmmPackage;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has TierId     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has Package    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'CmmPackageObj',);
has Name       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Percentage => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'Float',);
has Threshold  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);

# AUTO-GENERATED HAS-A END

1;

