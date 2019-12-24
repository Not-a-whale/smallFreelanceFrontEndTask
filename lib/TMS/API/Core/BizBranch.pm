package TMS::API::Core::BizBranch;

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

has 'BrnchEMail' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'BrnchFax'   => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'BrnchId'    => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'OfficeName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1', 'default' => '');

# relations
has 'fin_cheques'            => ('is' => 'rw', 'isa' => 'ArrayObjFinCheque',           'required' => '0');
has 'brnch_fax'              => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'required' => '0');
has 'fin_billing_banks'      => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingBank',      'required' => '0');
has 'dsp_loads_destinations' => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDestination', 'required' => '0');
has 'brnch_address'          => ('is' => 'rw', 'isa' => 'ObjCntAddress',               'required' => '0');
has 'inv_equipments'         => ('is' => 'rw', 'isa' => 'ArrayObjInvEquipment',        'required' => '0');
has 'inv_support_vendors'    => ('is' => 'rw', 'isa' => 'ArrayObjInvSupportVendor',    'required' => '0');
has 'biz'                    => ('is' => 'rw', 'isa' => 'ObjEntBusiness',              'required' => '0');
has 'ent_people'             => ('is' => 'rw', 'isa' => 'ArrayObjEntPerson',           'required' => '0');
has 'brnch_phone'            => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'required' => '0');

has 'vendor_fax'              => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'required' => '0');
has 'vendor_phone'            => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'required' => '0');
has 'vendor_address'          => ('is' => 'rw', 'isa' => 'ObjCntAddress',               'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'BizBranch');

1;
