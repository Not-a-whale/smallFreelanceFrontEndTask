package TMS::API::Core::HrResidence;

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

has 'DateMovedOut' => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'ResdenceId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

# relations
has 'res_phone'   => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax', 'required' => '0');
has 'ast'         => ('is' => 'rw', 'isa' => 'ObjHrAssociate',  'required' => '0');
has 'res_address' => ('is' => 'rw', 'isa' => 'ObjCntAddress',   'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'HrResidence');

1;
