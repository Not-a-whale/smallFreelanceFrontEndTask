package TMS::API::Core::EntPerson;

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
use TMS::API::Core::BizBranch;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has PrsnId     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has NickName   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Prefix     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Enum',);
has FirstName  => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has MiddleName => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has LastName   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has Suffix     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumSr',);
has BrnchId    => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'BizBranchObj | Int ',);

# AUTO-GENERATED HAS-A END

1;

