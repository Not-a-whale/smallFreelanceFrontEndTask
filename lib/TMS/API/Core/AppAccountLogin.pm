package TMS::API::Core::AppAccountLogin;

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
use TMS::API::Core::AppAccount;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has AccLoginId   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has AppAccountId => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'AppAccountObj | Int ',);
has IPAddress    => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Int',);
has DateLogin    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Type         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumLogin',);

# AUTO-GENERATED HAS-A END

1;

