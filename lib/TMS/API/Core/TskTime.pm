package TMS::API::Core::TskTime;

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

has 'duration'   => ('is' => 'rw', 'isa' => 'Any',           'coerce' => '0', 'required' => '0');
has 'finished'   => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'fulllength' => ('is' => 'rw', 'isa' => 'Int',           'coerce' => '0', 'required' => '0');
has 'started'    => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'tmeid'      => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

# relations
has 'actid' => ('is' => 'rw', 'isa' => 'ObjTskActn',   'coerce' => '1', 'required' => '0');
has 'prsn'  => ('is' => 'rw', 'isa' => 'ObjEntPerson', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'TskTime');

1;
