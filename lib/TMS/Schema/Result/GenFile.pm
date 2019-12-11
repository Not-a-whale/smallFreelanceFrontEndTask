use utf8;
package TMS::Schema::Result::GenFile;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::GenFile

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<gen_files>

=cut

__PACKAGE__->table("gen_files");

=head1 ACCESSORS

=head2 FileId

  accessor: 'file_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 DocumentTitle

  accessor: 'document_title'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 Keywords

  accessor: 'keywords'
  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 FileName

  accessor: 'file_name'
  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 FileData

  accessor: 'file_data'
  data_type: 'longblob'
  is_nullable: 0

=head2 SHASIG

  accessor: 'shasig'
  data_type: 'char'
  is_nullable: 0
  size: 64

=head2 MIMEType

  accessor: 'mimetype'
  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 UploadDate

  accessor: 'upload_date'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 1

=head2 ExpiredDate

  accessor: 'expired_date'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "FileId",
  {
    accessor => "file_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "DocumentTitle",
  {
    accessor => "document_title",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "Keywords",
  {
    accessor => "keywords",
    data_type => "varchar",
    is_nullable => 1,
    size => 1024,
  },
  "FileName",
  {
    accessor => "file_name",
    data_type => "varchar",
    is_nullable => 1,
    size => 1024,
  },
  "FileData",
  { accessor => "file_data", data_type => "longblob", is_nullable => 0 },
  "SHASIG",
  { accessor => "shasig", data_type => "char", is_nullable => 0, size => 64 },
  "MIMEType",
  {
    accessor => "mimetype",
    data_type => "varchar",
    is_nullable => 1,
    size => 1024,
  },
  "UploadDate",
  {
    accessor => "upload_date",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 1,
  },
  "ExpiredDate",
  {
    accessor => "expired_date",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "Notes",
  { accessor => "notes", data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</FileId>

=back

=cut

__PACKAGE__->set_primary_key("FileId");

=head1 UNIQUE CONSTRAINTS

=head2 C<SHASIG_UNIQUE>

=over 4

=item * L</SHASIG>

=back

=cut

__PACKAGE__->add_unique_constraint("SHASIG_UNIQUE", ["SHASIG"]);

=head1 RELATIONS

=head2 crr_ifta_decals

Type: has_many

Related object: L<TMS::Schema::Result::CrrIftaDecal>

=cut

__PACKAGE__->has_many(
  "crr_ifta_decals",
  "TMS::Schema::Result::CrrIftaDecal",
  { "foreign.DecalImg" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 crr_iftas

Type: has_many

Related object: L<TMS::Schema::Result::CrrIfta>

=cut

__PACKAGE__->has_many(
  "crr_iftas",
  "TMS::Schema::Result::CrrIfta",
  { "foreign.ProofDoc" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 crr_permit_account_docs

Type: has_many

Related object: L<TMS::Schema::Result::CrrPermitAccountDoc>

=cut

__PACKAGE__->has_many(
  "crr_permit_account_docs",
  "TMS::Schema::Result::CrrPermitAccountDoc",
  { "foreign.CrrPrmtAccDoc" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 crr_permit_images

Type: has_many

Related object: L<TMS::Schema::Result::CrrPermitImage>

=cut

__PACKAGE__->has_many(
  "crr_permit_images",
  "TMS::Schema::Result::CrrPermitImage",
  { "foreign.PermtImageId" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 drv_driverlicences

Type: has_many

Related object: L<TMS::Schema::Result::DrvDriverlicence>

=cut

__PACKAGE__->has_many(
  "drv_driverlicences",
  "TMS::Schema::Result::DrvDriverlicence",
  { "foreign.Photo" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 drv_medcards

Type: has_many

Related object: L<TMS::Schema::Result::DrvMedcard>

=cut

__PACKAGE__->has_many(
  "drv_medcards",
  "TMS::Schema::Result::DrvMedcard",
  { "foreign.Photo" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dsp_loads_destinations_docs

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsDestinationsDoc>

=cut

__PACKAGE__->has_many(
  "dsp_loads_destinations_docs",
  "TMS::Schema::Result::DspLoadsDestinationsDoc",
  { "foreign.FileId" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dsp_loads_docs

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsDoc>

=cut

__PACKAGE__->has_many(
  "dsp_loads_docs",
  "TMS::Schema::Result::DspLoadsDoc",
  { "foreign.FileId" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ent_carriers

Type: has_many

Related object: L<TMS::Schema::Result::EntCarrier>

=cut

__PACKAGE__->has_many(
  "ent_carriers",
  "TMS::Schema::Result::EntCarrier",
  { "foreign.McCertificatePhoto" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_billing_banks

Type: has_many

Related object: L<TMS::Schema::Result::FinBillingBank>

=cut

__PACKAGE__->has_many(
  "fin_billing_banks",
  "TMS::Schema::Result::FinBillingBank",
  { "foreign.VoidCheck" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_tax_ids

Type: has_many

Related object: L<TMS::Schema::Result::FinTaxId>

=cut

__PACKAGE__->has_many(
  "fin_tax_ids",
  "TMS::Schema::Result::FinTaxId",
  { "foreign.Photo" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_govidcards

Type: has_many

Related object: L<TMS::Schema::Result::HrGovidcard>

=cut

__PACKAGE__->has_many(
  "hr_govidcards",
  "TMS::Schema::Result::HrGovidcard",
  { "foreign.Photo" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_hire_records

Type: has_many

Related object: L<TMS::Schema::Result::HrHireRecord>

=cut

__PACKAGE__->has_many(
  "hr_hire_records",
  "TMS::Schema::Result::HrHireRecord",
  { "foreign.Photo" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_payrates

Type: has_many

Related object: L<TMS::Schema::Result::HrPayrate>

=cut

__PACKAGE__->has_many(
  "hr_payrates",
  "TMS::Schema::Result::HrPayrate",
  { "foreign.Agreement" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ins_policies

Type: has_many

Related object: L<TMS::Schema::Result::InsPolicy>

=cut

__PACKAGE__->has_many(
  "ins_policies",
  "TMS::Schema::Result::InsPolicy",
  { "foreign.ProofOfInsurance" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 inv_equipment_docs

Type: has_many

Related object: L<TMS::Schema::Result::InvEquipmentDoc>

=cut

__PACKAGE__->has_many(
  "inv_equipment_docs",
  "TMS::Schema::Result::InvEquipmentDoc",
  { "foreign.FileId" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sft_vehicle_inspect_proofs

Type: has_many

Related object: L<TMS::Schema::Result::SftVehicleInspectProof>

=cut

__PACKAGE__->has_many(
  "sft_vehicle_inspect_proofs",
  "TMS::Schema::Result::SftVehicleInspectProof",
  { "foreign.FileRef" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sft_vehicle_inspections

Type: has_many

Related object: L<TMS::Schema::Result::SftVehicleInspection>

=cut

__PACKAGE__->has_many(
  "sft_vehicle_inspections",
  "TMS::Schema::Result::SftVehicleInspection",
  { "foreign.InspectorSignatureId" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sft_vehicle_registrations

Type: has_many

Related object: L<TMS::Schema::Result::SftVehicleRegistration>

=cut

__PACKAGE__->has_many(
  "sft_vehicle_registrations",
  "TMS::Schema::Result::SftVehicleRegistration",
  { "foreign.RegistrationCard" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-10 15:38:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2oRRiz3vG3u+TOtG5+KWRQ
# These lines were loaded from '/home/cpeter/temp/lib/TMS/Schema/Result/GenFile.pm' found in @INC.
# They are now part of the custom portion of this file
# for you to hand-edit.  If you do not either delete
# this section or remove that file from @INC, this section
# will be repeated redundantly when you re-create this
# file again via Loader!  See skip_load_external to disable
# this feature.

use utf8;
package TMS::Schema::Result::GenFile;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::GenFile

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<gen_files>

=cut

__PACKAGE__->table("gen_files");

=head1 ACCESSORS

=head2 FileId

  accessor: 'file_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 DocumentTitle

  accessor: 'document_title'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 Keywords

  accessor: 'keywords'
  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 FileName

  accessor: 'file_name'
  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 FileData

  accessor: 'file_data'
  data_type: 'longblob'
  is_nullable: 0

=head2 SHASIG

  accessor: 'shasig'
  data_type: 'char'
  is_nullable: 0
  size: 64

=head2 MIMEType

  accessor: 'mimetype'
  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 UploadDate

  accessor: 'upload_date'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 1

=head2 ExpiredDate

  accessor: 'expired_date'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "FileId",
  {
    accessor => "file_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "DocumentTitle",
  {
    accessor => "document_title",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "Keywords",
  {
    accessor => "keywords",
    data_type => "varchar",
    is_nullable => 1,
    size => 1024,
  },
  "FileName",
  {
    accessor => "file_name",
    data_type => "varchar",
    is_nullable => 1,
    size => 1024,
  },
  "FileData",
  { accessor => "file_data", data_type => "longblob", is_nullable => 0 },
  "SHASIG",
  { accessor => "shasig", data_type => "char", is_nullable => 0, size => 64 },
  "MIMEType",
  {
    accessor => "mimetype",
    data_type => "varchar",
    is_nullable => 1,
    size => 1024,
  },
  "UploadDate",
  {
    accessor => "upload_date",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 1,
  },
  "ExpiredDate",
  {
    accessor => "expired_date",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "Notes",
  { accessor => "notes", data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</FileId>

=back

=cut

__PACKAGE__->set_primary_key("FileId");

=head1 UNIQUE CONSTRAINTS

=head2 C<SHASIG_UNIQUE>

=over 4

=item * L</SHASIG>

=back

=cut

__PACKAGE__->add_unique_constraint("SHASIG_UNIQUE", ["SHASIG"]);

=head1 RELATIONS

=head2 crr_ifta_decals

Type: has_many

Related object: L<TMS::Schema::Result::CrrIftaDecal>

=cut

__PACKAGE__->has_many(
  "crr_ifta_decals",
  "TMS::Schema::Result::CrrIftaDecal",
  { "foreign.DecalImg" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 crr_iftas

Type: has_many

Related object: L<TMS::Schema::Result::CrrIfta>

=cut

__PACKAGE__->has_many(
  "crr_iftas",
  "TMS::Schema::Result::CrrIfta",
  { "foreign.ProofDoc" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 crr_permit_account_docs

Type: has_many

Related object: L<TMS::Schema::Result::CrrPermitAccountDoc>

=cut

__PACKAGE__->has_many(
  "crr_permit_account_docs",
  "TMS::Schema::Result::CrrPermitAccountDoc",
  { "foreign.CrrPrmtAccDoc" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 crr_permit_images

Type: has_many

Related object: L<TMS::Schema::Result::CrrPermitImage>

=cut

__PACKAGE__->has_many(
  "crr_permit_images",
  "TMS::Schema::Result::CrrPermitImage",
  { "foreign.PermtImageId" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 drv_driverlicences

Type: has_many

Related object: L<TMS::Schema::Result::DrvDriverlicence>

=cut

__PACKAGE__->has_many(
  "drv_driverlicences",
  "TMS::Schema::Result::DrvDriverlicence",
  { "foreign.Photo" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 drv_medcards

Type: has_many

Related object: L<TMS::Schema::Result::DrvMedcard>

=cut

__PACKAGE__->has_many(
  "drv_medcards",
  "TMS::Schema::Result::DrvMedcard",
  { "foreign.Photo" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dsp_loads_destinations_docs

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsDestinationsDoc>

=cut

__PACKAGE__->has_many(
  "dsp_loads_destinations_docs",
  "TMS::Schema::Result::DspLoadsDestinationsDoc",
  { "foreign.FileId" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dsp_loads_docs

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsDoc>

=cut

__PACKAGE__->has_many(
  "dsp_loads_docs",
  "TMS::Schema::Result::DspLoadsDoc",
  { "foreign.FileId" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ent_carriers

Type: has_many

Related object: L<TMS::Schema::Result::EntCarrier>

=cut

__PACKAGE__->has_many(
  "ent_carriers",
  "TMS::Schema::Result::EntCarrier",
  { "foreign.McCertificatePhoto" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_billing_banks

Type: has_many

Related object: L<TMS::Schema::Result::FinBillingBank>

=cut

__PACKAGE__->has_many(
  "fin_billing_banks",
  "TMS::Schema::Result::FinBillingBank",
  { "foreign.VoidCheck" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_tax_ids

Type: has_many

Related object: L<TMS::Schema::Result::FinTaxId>

=cut

__PACKAGE__->has_many(
  "fin_tax_ids",
  "TMS::Schema::Result::FinTaxId",
  { "foreign.Photo" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_govidcards

Type: has_many

Related object: L<TMS::Schema::Result::HrGovidcard>

=cut

__PACKAGE__->has_many(
  "hr_govidcards",
  "TMS::Schema::Result::HrGovidcard",
  { "foreign.Photo" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_hire_records

Type: has_many

Related object: L<TMS::Schema::Result::HrHireRecord>

=cut

__PACKAGE__->has_many(
  "hr_hire_records",
  "TMS::Schema::Result::HrHireRecord",
  { "foreign.Photo" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_payrates

Type: has_many

Related object: L<TMS::Schema::Result::HrPayrate>

=cut

__PACKAGE__->has_many(
  "hr_payrates",
  "TMS::Schema::Result::HrPayrate",
  { "foreign.Agreement" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ins_policies

Type: has_many

Related object: L<TMS::Schema::Result::InsPolicy>

=cut

__PACKAGE__->has_many(
  "ins_policies",
  "TMS::Schema::Result::InsPolicy",
  { "foreign.ProofOfInsurance" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 inv_equipment_docs

Type: has_many

Related object: L<TMS::Schema::Result::InvEquipmentDoc>

=cut

__PACKAGE__->has_many(
  "inv_equipment_docs",
  "TMS::Schema::Result::InvEquipmentDoc",
  { "foreign.FileId" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sft_vehicle_inspect_proofs

Type: has_many

Related object: L<TMS::Schema::Result::SftVehicleInspectProof>

=cut

__PACKAGE__->has_many(
  "sft_vehicle_inspect_proofs",
  "TMS::Schema::Result::SftVehicleInspectProof",
  { "foreign.FileRef" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sft_vehicle_inspections

Type: has_many

Related object: L<TMS::Schema::Result::SftVehicleInspection>

=cut

__PACKAGE__->has_many(
  "sft_vehicle_inspections",
  "TMS::Schema::Result::SftVehicleInspection",
  { "foreign.InspectorSignatureId" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sft_vehicle_registrations

Type: has_many

Related object: L<TMS::Schema::Result::SftVehicleRegistration>

=cut

__PACKAGE__->has_many(
  "sft_vehicle_registrations",
  "TMS::Schema::Result::SftVehicleRegistration",
  { "foreign.RegistrationCard" => "self.FileId" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-10 12:29:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MalnBzm6dE3d61gAs0E5sA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;