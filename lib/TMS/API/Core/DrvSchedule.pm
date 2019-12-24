package TMS::API::Core::DrvSchedule;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

$Data::Dumper::Terse = 1;

use Moose;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Complex;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'DesiredDestNote' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'DrvSchdId'       => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'PostedDate'      => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');

# relations
has 'posted_by'    => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'required' => '0');
has 'desired_dest' => ('is' => 'rw', 'isa' => 'ObjDrvDesttype', 'required' => '0');
has 'driver'       => ('is' => 'rw', 'isa' => 'ObjDrvDriver',   'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'DrvSchedule');

1;
