package TMS::API::Core::AppAccountLock;

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
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has AccLockId       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has AppAccountId    => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'AppAccountObj',);
has IPAddress       => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Int',);
has LoginAttempts   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Logins          => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Locked          => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);
has DateLastLogin   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has DateLastAttempt => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);

# AUTO-GENERATED HAS-A END

1;
