package TMS::API::Core::EntBlacklist;

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

has 'BlackListId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'Type'        => ('is' => 'rw', 'isa' => 'Any',           'required' => '1', 'default' => 'private');

# relations
has 'entity'  => ('is' => 'rw', 'isa' => 'ObjEntity',      'required' => '0');
has 'creator' => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'EntBlacklist');

1;
