package TMS::API::Core::DrvDriverlicence;

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
use TMS::API::Types::Columns;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'DrLcEndorsement' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'DrLcId'          => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'DriverId'        => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'Photo'           => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');

# relations depends on
has 'dr_lc_endorsement' => ('is' => 'rw', 'isa' => 'ObjDrvCdlEndorsement', 'coerce' => '1', 'required' => '0');
has 'driver'            => ('is' => 'rw', 'isa' => 'ObjDrvDriver',         'coerce' => '1', 'required' => '0');
has 'photo'             => ('is' => 'rw', 'isa' => 'ObjGenFile',           'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'DrvDriverlicence');

1;
