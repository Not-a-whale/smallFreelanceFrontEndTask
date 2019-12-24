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

has 'DocumentTitle' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'ExpiredDate'   => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'FileId'        => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'FileName'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Keywords'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'MIMEType'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Notes'         => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'UploadDate'    => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');

# relations
has 'crr_permit_images'         => ('is' => 'rw', 'isa' => 'ArrayObjCrrPermitImage',         'required' => '0');
has 'fin_tax_ids'               => ('is' => 'rw', 'isa' => 'ArrayObjFinTaxId',               'required' => '0');
has 'fin_billing_banks'         => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingBank',         'required' => '0');
has 'hr_govidcards'             => ('is' => 'rw', 'isa' => 'ArrayObjHrGovidcard',            'required' => '0');
has 'sft_vehicle_registrations' => ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleRegistration', 'required' => '0');
has 'hr_payrates'               => ('is' => 'rw', 'isa' => 'ArrayObjHrPayrate',              'required' => '0');
has 'hr_hire_records'           => ('is' => 'rw', 'isa' => 'ArrayObjHrHireRecord',           'required' => '0');
has 'crr_permit_account_docs'   => ('is' => 'rw', 'isa' => 'ArrayObjCrrPermitAccountDoc',    'required' => '0');
has 'ent_carriers'              => ('is' => 'rw', 'isa' => 'ArrayObjEntCarrier',             'required' => '0');
has 'ins_policies'              => ('is' => 'rw', 'isa' => 'ArrayObjInsPolicy',              'required' => '0');
has 'drv_driverlicences'        => ('is' => 'rw', 'isa' => 'ArrayObjDrvDriverlicence',       'required' => '0');
has 'dsp_loads_docs'            => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDoc',            'required' => '0');
has 'crr_ifta_decals'           => ('is' => 'rw', 'isa' => 'ArrayObjCrrIftaDecal',           'required' => '0');
has 'crr_iftas'                 => ('is' => 'rw', 'isa' => 'ArrayObjCrrIfta',                'required' => '0');
has 'inv_equipment_docs'        => ('is' => 'rw', 'isa' => 'ArrayObjInvEquipmentDoc',        'required' => '0');
has 'sft_vehicle_inspect_proofs' =>
    ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleInspectProof', 'required' => '0');
has 'sft_vehicle_inspections' => ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleInspection', 'required' => '0');
has 'drv_medcards'            => ('is' => 'rw', 'isa' => 'ArrayObjDrvMedcard',           'required' => '0');
has 'dsp_loads_destinations_docs' =>
    ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDestinationsDoc', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'GenFile');

1;
