package TMS::API::Core::DrvCdlEndorsement;

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
has EndrsId       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has Endorsement   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has ValidFromDate => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);
has ExpiredDate   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);

# AUTO-GENERATED HAS-A END

1;

