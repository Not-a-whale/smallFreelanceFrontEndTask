package TMS::API::Core::MsgNote;

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

has 'author'   => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'keywords' => ('is' => 'rw', 'isa' => 'VarChar1024',   'coerce' => '1', 'required' => '0');
has 'macsid'   => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'mnoteid'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'posted'   => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'subject'  => ('is' => 'rw', 'isa' => 'VarChar1024',   'coerce' => '1', 'required' => '0');

# relations depends on
has 'author' => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'coerce' => '1', 'required' => '0');
has 'macsid' => ('is' => 'rw', 'isa' => 'ObjMsgAccess',   'coerce' => '1', 'required' => '0');

# relations point to us
has 'msg_brk_loadstatuses'       => ('is' => 'rw', 'isa' => 'ArrayObjMsgBrkLoadstatus',       'coerce' => '1', 'required' => '0');
has 'msg_cnt_addresses'          => ('is' => 'rw', 'isa' => 'ArrayObjMsgCntAddress',          'coerce' => '1', 'required' => '0');
has 'msg_cnt_phonesfaxes'        => ('is' => 'rw', 'isa' => 'ArrayObjMsgCntPhonesfax',        'coerce' => '1', 'required' => '0');
has 'msg_drv_desttypes'          => ('is' => 'rw', 'isa' => 'ArrayObjMsgDrvDesttype',         'coerce' => '1', 'required' => '0');
has 'msg_drv_schedules'          => ('is' => 'rw', 'isa' => 'ArrayObjMsgDrvSchedule',         'coerce' => '1', 'required' => '0');
has 'msg_dsp_loads'              => ('is' => 'rw', 'isa' => 'ArrayObjMsgDspLoad',             'coerce' => '1', 'required' => '0');
has 'msg_dsp_loads_destinations' => ('is' => 'rw', 'isa' => 'ArrayObjMsgDspLoadsDestination', 'coerce' => '1', 'required' => '0');
has 'msg_dsp_loads_trackings'    => ('is' => 'rw', 'isa' => 'ArrayObjMsgDspLoadsTracking',    'coerce' => '1', 'required' => '0');
has 'msg_dsp_trips'              => ('is' => 'rw', 'isa' => 'ArrayObjMsgDspTrip',             'coerce' => '1', 'required' => '0');
has 'msg_ent_blacklists'         => ('is' => 'rw', 'isa' => 'ArrayObjMsgEntBlacklist',        'coerce' => '1', 'required' => '0');
has 'msg_ent_carriers'           => ('is' => 'rw', 'isa' => 'ArrayObjMsgEntCarrier',          'coerce' => '1', 'required' => '0');
has 'msg_ent_customers'          => ('is' => 'rw', 'isa' => 'ArrayObjMsgEntCustomer',         'coerce' => '1', 'required' => '0');
has 'msg_ent_shippers'           => ('is' => 'rw', 'isa' => 'ArrayObjMsgEntShipper',          'coerce' => '1', 'required' => '0');
has 'msg_entities'               => ('is' => 'rw', 'isa' => 'ArrayObjMsgEntity',              'coerce' => '1', 'required' => '0');
has 'msg_fin_billing_banks'      => ('is' => 'rw', 'isa' => 'ArrayObjMsgFinBillingBank',      'coerce' => '1', 'required' => '0');
has 'msg_fin_billing_infos'      => ('is' => 'rw', 'isa' => 'ArrayObjMsgFinBillingInfo',      'coerce' => '1', 'required' => '0');
has 'msg_fin_billing_rules'      => ('is' => 'rw', 'isa' => 'ArrayObjMsgFinBillingRule',      'coerce' => '1', 'required' => '0');
has 'msg_fin_invoices'           => ('is' => 'rw', 'isa' => 'ArrayObjMsgFinInvoice',          'coerce' => '1', 'required' => '0');
has 'msg_fin_invoices_items'     => ('is' => 'rw', 'isa' => 'ArrayObjMsgFinInvoicesItem',     'coerce' => '1', 'required' => '0');
has 'msg_fin_item_templates'     => ('is' => 'rw', 'isa' => 'ArrayObjMsgFinItemTemplate',     'coerce' => '1', 'required' => '0');
has 'msg_fin_item_templates_types' =>
    ('is' => 'rw', 'isa' => 'ArrayObjMsgFinItemTemplatesType', 'coerce' => '1', 'required' => '0');
has 'msg_fin_scheduled_deductions' =>
    ('is' => 'rw', 'isa' => 'ArrayObjMsgFinScheduledDeduction', 'coerce' => '1', 'required' => '0');
has 'msg_fin_tax_ids'             => ('is' => 'rw', 'isa' => 'ArrayObjMsgFinTaxId',            'coerce' => '1', 'required' => '0');
has 'msg_fin_transactions'        => ('is' => 'rw', 'isa' => 'ArrayObjMsgFinTransaction',      'coerce' => '1', 'required' => '0');
has 'msg_gen_files'               => ('is' => 'rw', 'isa' => 'ArrayObjMsgGenFile',             'coerce' => '1', 'required' => '0');
has 'msg_hr_associates'           => ('is' => 'rw', 'isa' => 'ArrayObjMsgHrAssociate',         'coerce' => '1', 'required' => '0');
has 'msg_hr_emrgency_contacts'    => ('is' => 'rw', 'isa' => 'ArrayObjMsgHrEmrgencyContact',   'coerce' => '1', 'required' => '0');
has 'msg_hr_references'           => ('is' => 'rw', 'isa' => 'ArrayObjMsgHrReference',         'coerce' => '1', 'required' => '0');
has 'msg_ins_to_entities'         => ('is' => 'rw', 'isa' => 'ArrayObjMsgInsToEntity',         'coerce' => '1', 'required' => '0');
has 'msg_ins_to_vehicles'         => ('is' => 'rw', 'isa' => 'ArrayObjMsgInsToVehicle',        'coerce' => '1', 'required' => '0');
has 'msg_inv_notes'               => ('is' => 'rw', 'isa' => 'ArrayObjMsgInvNote',             'coerce' => '1', 'required' => '0');
has 'msg_inv_roles'               => ('is' => 'rw', 'isa' => 'ArrayObjMsgInvRole',             'coerce' => '1', 'required' => '0');
has 'msg_inv_support_vendors'     => ('is' => 'rw', 'isa' => 'ArrayObjMsgInvSupportVendor',    'coerce' => '1', 'required' => '0');
has 'msg_inv_units_to_equipments' => ('is' => 'rw', 'isa' => 'ArrayObjMsgInvUnitsToEquipment', 'coerce' => '1', 'required' => '0');
has 'msg_sft_logbooks'            => ('is' => 'rw', 'isa' => 'ArrayObjMsgSftLogbook',          'coerce' => '1', 'required' => '0');
has 'msg_sft_vehicle_inspect_items' =>
    ('is' => 'rw', 'isa' => 'ArrayObjMsgSftVehicleInspectItem', 'coerce' => '1', 'required' => '0');
has 'msg_sft_vehicle_inspect_proofs' =>
    ('is' => 'rw', 'isa' => 'ArrayObjMsgSftVehicleInspectProof', 'coerce' => '1', 'required' => '0');
has 'msg_sft_vehicle_inspections' => ('is' => 'rw', 'isa' => 'ArrayObjMsgSftVehicleInspection', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'MsgNote');

1;
