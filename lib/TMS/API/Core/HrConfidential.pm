package TMS::API::Core::HrConfidential;

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
use TMS::API::Core::CntPhonesfax;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has AstId         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'HrAssociateObj | Int ',);
has Birthday      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);
has MaritalStatus => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EnumSingle',);
has Gender        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EnumMale',);
has PersonalPhone => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'CntPhonesfaxObj | Int ',);
has PersonalEmail => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);

# AUTO-GENERATED HAS-A END

1;

