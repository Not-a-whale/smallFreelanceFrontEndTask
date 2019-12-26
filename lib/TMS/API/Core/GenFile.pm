package TMS::API::Core::GenFile;

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

has 'DocumentTitle' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'ExpiredDate'   => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'FileId'        => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '0');
has 'FileName'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Keywords'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'MIMEType'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Notes'         => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'UploadDate'    => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');

# relations
has 'fin_billing_banks'       => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingBank',      'coerce' => '1', 'required' => '0');
has 'crr_permit_account_docs' => ('is' => 'rw', 'isa' => 'ArrayObjCrrPermitAccountDoc', 'coerce' => '1', 'required' => '0');
has 'ins_policies'            => ('is' => 'rw', 'isa' => 'ArrayObjInsPolicy',           'coerce' => '1', 'required' => '0');
has 'crr_ifta_decals'         => ('is' => 'rw', 'isa' => 'ArrayObjCrrIftaDecal',        'coerce' => '1', 'required' => '0');
has 'fin_tax_ids'             => ('is' => 'rw', 'isa' => 'ArrayObjFinTaxId',            'coerce' => '1', 'required' => '0');
has 'drv_driverlicences'      => ('is' => 'rw', 'isa' => 'ArrayObjDrvDriverlicence',    'coerce' => '1', 'required' => '0');
has 'sft_vehicle_inspect_proofs' =>
    ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleInspectProof', 'coerce' => '1', 'required' => '0');
has 'drv_medcards'            => ('is' => 'rw', 'isa' => 'ArrayObjDrvMedcard',           'coerce' => '1', 'required' => '0');
has 'crr_iftas'               => ('is' => 'rw', 'isa' => 'ArrayObjCrrIfta',              'coerce' => '1', 'required' => '0');
has 'inv_equipment_docs'      => ('is' => 'rw', 'isa' => 'ArrayObjInvEquipmentDoc',      'coerce' => '1', 'required' => '0');
has 'sft_vehicle_inspections' => ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleInspection', 'coerce' => '1', 'required' => '0');
has 'dsp_loads_docs'          => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDoc',          'coerce' => '1', 'required' => '0');
has 'ent_carriers'            => ('is' => 'rw', 'isa' => 'ArrayObjEntCarrier',           'coerce' => '1', 'required' => '0');
has 'hr_hire_records'         => ('is' => 'rw', 'isa' => 'ArrayObjHrHireRecord',         'coerce' => '1', 'required' => '0');
has 'hr_payrates'             => ('is' => 'rw', 'isa' => 'ArrayObjHrPayrate',            'coerce' => '1', 'required' => '0');
has 'dsp_loads_destinations_docs' =>
    ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDestinationsDoc', 'coerce' => '1', 'required' => '0');
has 'crr_permit_images' => ('is' => 'rw', 'isa' => 'ArrayObjCrrPermitImage', 'coerce' => '1', 'required' => '0');
has 'hr_govidcards'     => ('is' => 'rw', 'isa' => 'ArrayObjHrGovidcard',    'coerce' => '1', 'required' => '0');
has 'sft_vehicle_registrations' =>
    ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleRegistration', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'GenFile');

1;
