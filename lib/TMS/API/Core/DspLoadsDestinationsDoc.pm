package TMS::API::Core::DspLoadsDestinationsDoc;

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

has 'DestFileId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

# relations
has 'approved_by'      => ('is' => 'rw', 'isa' => 'ObjHrAssociate',         'coerce' => '1', 'required' => '0');
has 'file'             => ('is' => 'rw', 'isa' => 'ObjGenFile',             'coerce' => '1', 'required' => '0');
has 'load_destination' => ('is' => 'rw', 'isa' => 'ObjDspLoadsDestination', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'DspLoadsDestinationsDoc');

1;
