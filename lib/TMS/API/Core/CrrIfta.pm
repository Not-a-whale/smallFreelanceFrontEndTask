package TMS::API::Core::CrrIfta;

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

has 'IftaAcctId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'ProofDoc'   => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');

# relations
has 'crr_ifta_decals' => ('is' => 'rw', 'isa' => 'ArrayObjCrrIftaDecal', 'required' => '0');
has 'biz'             => ('is' => 'rw', 'isa' => 'ObjEntBusiness',       'required' => '0');
has 'proof_doc'       => ('is' => 'rw', 'isa' => 'ObjGenFile',           'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'CrrIfta');

1;
