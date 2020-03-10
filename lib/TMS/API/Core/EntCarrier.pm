package TMS::API::Core::EntCarrier;

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

has 'CarrierId'            => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'CrType'               => ('is' => 'rw', 'isa' => 'enum_CrType',   'coerce' => '1', 'required' => '0');
has 'DOT'                  => ('is' => 'rw', 'isa' => 'DOTnum',        'coerce' => '1', 'required' => '0');
has 'MC'                   => ('is' => 'rw', 'isa' => 'MCnum',         'coerce' => '1', 'required' => '0');
has 'McCertificatePhoto'   => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'RateConfEmailAddress' => ('is' => 'rw', 'isa' => 'VarChar255',    'coerce' => '1', 'required' => '0');
has 'SCAC'                 => ('is' => 'rw', 'isa' => 'SCAC',          'coerce' => '1', 'required' => '0');

# relations depends on
has 'carrier'              => ('is' => 'rw', 'isa' => 'ObjEntBusiness', 'coerce' => '1', 'required' => '0');
has 'mc_certificate_photo' => ('is' => 'rw', 'isa' => 'ObjGenFile',     'coerce' => '1', 'required' => '0');

# relations point to us
has 'crr_permit_accounts' => ('is' => 'rw', 'isa' => 'ArrayObjCrrPermitAccount', 'coerce' => '1', 'required' => '0');
has 'ent_owner_operators' => ('is' => 'rw', 'isa' => 'ArrayObjEntOwnerOperator', 'coerce' => '1', 'required' => '0');
has 'inv_vehicles'        => ('is' => 'rw', 'isa' => 'ArrayObjInvVehicle',       'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'EntCarrier');

1;
