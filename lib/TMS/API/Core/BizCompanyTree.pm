package TMS::API::Core::BizCompanyTree;

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
use TMS::API::Core::BizCompanyNode;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has Ans_Des_Id   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has AncestorId   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'BizCompanyNodeObj | Int ',);
has DescendantId => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'BizCompanyNodeObj | Int ',);
has Depth        => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Int',);

# AUTO-GENERATED HAS-A END

1;

