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

has 'BrnchEMail' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'BrnchFax'   => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'BrnchId'    => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '0');

# relations
has 'biz'                    => ('is' => 'rw', 'isa' => 'ObjEntBusiness',              'coerce' => '1', 'required' => '0');
has 'brnch_address'          => ('is' => 'rw', 'isa' => 'ObjCntAddress',               'coerce' => '1', 'required' => '0');
has 'brnch_fax'              => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'coerce' => '1', 'required' => '0');
has 'brnch_phone'            => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'coerce' => '1', 'required' => '0');
has 'customer_address'       => ('is' => 'rw', 'isa' => 'ObjCntAddress',               'coerce' => '1', 'required' => '0');
has 'customer_biz'           => ('is' => 'rw', 'isa' => 'ObjEntBusiness',              'coerce' => '1', 'required' => '0');
has 'customer_fax'           => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'coerce' => '1', 'required' => '0');
has 'customer_phone'         => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'coerce' => '1', 'required' => '0');
has 'dispatcher_address'     => ('is' => 'rw', 'isa' => 'ObjCntAddress',               'coerce' => '1', 'required' => '0');
has 'dispatcher_biz'         => ('is' => 'rw', 'isa' => 'ObjEntBusiness',              'coerce' => '1', 'required' => '0');
has 'dispatcher_fax'         => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'coerce' => '1', 'required' => '0');
has 'dispatcher_phone'       => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'coerce' => '1', 'required' => '0');
has 'driver_address'         => ('is' => 'rw', 'isa' => 'ObjCntAddress',               'coerce' => '1', 'required' => '0');
has 'driver_biz'             => ('is' => 'rw', 'isa' => 'ObjEntBusiness',              'coerce' => '1', 'required' => '0');
has 'driver_fax'             => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'coerce' => '1', 'required' => '0');
has 'driver_phone'           => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'coerce' => '1', 'required' => '0');
has 'dsp_loads_destinations' => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDestination', 'coerce' => '1', 'required' => '0');
has 'ent_people'             => ('is' => 'rw', 'isa' => 'ArrayObjEntPerson',           'coerce' => '1', 'required' => '0');
has 'fin_billing_banks'      => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingBank',      'coerce' => '1', 'required' => '0');
has 'fin_cheques'            => ('is' => 'rw', 'isa' => 'ArrayObjFinCheque',           'coerce' => '1', 'required' => '0');
has 'inv_equipments'         => ('is' => 'rw', 'isa' => 'ArrayObjInvEquipment',        'coerce' => '1', 'required' => '0');
has 'inv_support_vendors'    => ('is' => 'rw', 'isa' => 'ArrayObjInvSupportVendor',    'coerce' => '1', 'required' => '0');
has 'owner_address'          => ('is' => 'rw', 'isa' => 'ObjCntAddress',               'coerce' => '1', 'required' => '0');
has 'owner_biz'              => ('is' => 'rw', 'isa' => 'ObjEntBusiness',              'coerce' => '1', 'required' => '0');
has 'owner_fax'              => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'coerce' => '1', 'required' => '0');
has 'owner_phone'            => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'coerce' => '1', 'required' => '0');
has 'primary_contact'        => ('is' => 'rw', 'isa' => 'ArrayObjEntPerson',           'coerce' => '1', 'required' => '0');
has 'shipper_address'        => ('is' => 'rw', 'isa' => 'ObjCntAddress',               'coerce' => '1', 'required' => '0');
has 'shipper_biz'            => ('is' => 'rw', 'isa' => 'ObjEntBusiness',              'coerce' => '1', 'required' => '0');
has 'shipper_fax'            => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'coerce' => '1', 'required' => '0');
has 'shipper_phone'          => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'coerce' => '1', 'required' => '0');
has 'vendor_address'         => ('is' => 'rw', 'isa' => 'ObjCntAddress',               'coerce' => '1', 'required' => '0');
has 'vendor_biz'             => ('is' => 'rw', 'isa' => 'ObjEntBusiness',              'coerce' => '1', 'required' => '0');
has 'vendor_fax'             => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'coerce' => '1', 'required' => '0');
has 'vendor_phone'           => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',             'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'BizBranch');

1;
