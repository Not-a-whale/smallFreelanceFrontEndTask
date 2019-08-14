package TMS::API::Core::SftLogEntry;

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
use TMS::API::Core::SftLogbook;
use TMS::API::Core::SftElogStat;
use TMS::API::Core::DrvDriver;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has LogbookEntryId => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has LogbookId      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'SftLogbookObj',);
has Location       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'SftElogStatObj',);
has StartTime      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Activity       => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumOnDuty',);
has DriverId       => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DrvDriverObj',);

# AUTO-GENERATED HAS-A END

1;

