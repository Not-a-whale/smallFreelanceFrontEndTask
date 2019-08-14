package TMS::API::Core::DspLoadsDoc;

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
use TMS::API::Core::DspLoad;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::GenFile;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has FileId    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'GenFileObj',);
has LoadId    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DspLoadObj',);
has DateAdded => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has AddedBy   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj',);

# AUTO-GENERATED HAS-A END

1;

