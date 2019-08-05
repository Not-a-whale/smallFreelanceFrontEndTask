package TMS::API::Core::HrWorkauthorization;

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
use TMS::API::Core::GenFile;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has WrkAuthId      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has AstId          => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj',);
has Photo          => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'GenFileObj',);
has DocumentName   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has DocumentNumber => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has ExpirationDate => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);

# AUTO-GENERATED HAS-A END

1;
