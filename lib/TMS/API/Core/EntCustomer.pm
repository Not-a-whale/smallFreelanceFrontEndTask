package TMS::API::Core::EntCustomer;

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

has 'Bond'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'CreditLimit' => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '0');
has 'CstmrId'     => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '0');
has 'DOT'         => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'DUNS'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'DontUse'     => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');
has 'Factoring'   => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');
has 'MC'          => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'SCAC'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Terms'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'WhyDontUse'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

# relations
has 'cmm_assignments_customers' => ('is' => 'rw', 'isa' => 'ArrayObjCmmAssignmentsCustomer', 'coerce' => '1', 'required' => '0');
has 'cstmr'                     => ('is' => 'rw', 'isa' => 'ObjEntBusiness',                 'coerce' => '1', 'required' => '0');
has 'dsp_loads'                 => ('is' => 'rw', 'isa' => 'ArrayObjDspLoad',                'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'EntCustomer');

1;
