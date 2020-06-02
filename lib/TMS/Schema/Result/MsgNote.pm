use utf8;

package TMS::Schema::Result::MsgNote;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::MsgNote

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<msg_notes>

=cut

__PACKAGE__->table("msg_notes");

=head1 ACCESSORS

=head2 mnoteid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 subject

  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 body

  data_type: 'text'
  is_nullable: 0

=head2 posted

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 author

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 macsid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 keywords

  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=cut

__PACKAGE__->add_columns(
    "mnoteid",
    {   data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "subject",
    {data_type => "varchar", is_nullable => 1, size => 1024},
    "body",
    {data_type => "text", is_nullable => 0},
    "posted",
    {   data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "author",
    {   data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "macsid",
    {   data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "keywords",
    {data_type => "varchar", is_nullable => 1, size => 1024},
);

=head1 PRIMARY KEY

=over 4

=item * L</mnoteid>

=back

=cut

__PACKAGE__->set_primary_key("mnoteid");

=head1 RELATIONS

=head2 author

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "author",
    "TMS::Schema::Result::HrAssociate",
    {AstId => "author"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 macsid

Type: belongs_to

Related object: L<TMS::Schema::Result::MsgAccess>

=cut

__PACKAGE__->belongs_to(
    "macsid",
    "TMS::Schema::Result::MsgAccess",
    {macsid        => "macsid"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 msg_brk_loadstatuses

Type: has_many

Related object: L<TMS::Schema::Result::MsgBrkLoadstatus>

=cut

__PACKAGE__->has_many(
    "msg_brk_loadstatuses", "TMS::Schema::Result::MsgBrkLoadstatus",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_cnt_addresses

Type: has_many

Related object: L<TMS::Schema::Result::MsgCntAddress>

=cut

__PACKAGE__->has_many(
    "msg_cnt_addresses", "TMS::Schema::Result::MsgCntAddress",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_cnt_phonesfaxes

Type: has_many

Related object: L<TMS::Schema::Result::MsgCntPhonesfax>

=cut

__PACKAGE__->has_many(
    "msg_cnt_phonesfaxes", "TMS::Schema::Result::MsgCntPhonesfax",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_drv_desttypes

Type: has_many

Related object: L<TMS::Schema::Result::MsgDrvDesttype>

=cut

__PACKAGE__->has_many(
    "msg_drv_desttypes", "TMS::Schema::Result::MsgDrvDesttype",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_drv_schedules

Type: has_many

Related object: L<TMS::Schema::Result::MsgDrvSchedule>

=cut

__PACKAGE__->has_many(
    "msg_drv_schedules", "TMS::Schema::Result::MsgDrvSchedule",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_dsp_loads

Type: has_many

Related object: L<TMS::Schema::Result::MsgDspLoad>

=cut

__PACKAGE__->has_many(
    "msg_dsp_loads",
    "TMS::Schema::Result::MsgDspLoad",
    {"foreign.mnoteid" => "self.mnoteid"},
    {cascade_copy      => 0, cascade_delete => 0},
);

=head2 msg_dsp_loads_destinations

Type: has_many

Related object: L<TMS::Schema::Result::MsgDspLoadsDestination>

=cut

__PACKAGE__->has_many(
    "msg_dsp_loads_destinations", "TMS::Schema::Result::MsgDspLoadsDestination",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_dsp_loads_trackings

Type: has_many

Related object: L<TMS::Schema::Result::MsgDspLoadsTracking>

=cut

__PACKAGE__->has_many(
    "msg_dsp_loads_trackings", "TMS::Schema::Result::MsgDspLoadsTracking",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_dsp_trips

Type: has_many

Related object: L<TMS::Schema::Result::MsgDspTrip>

=cut

__PACKAGE__->has_many(
    "msg_dsp_trips",
    "TMS::Schema::Result::MsgDspTrip",
    {"foreign.mnoteid" => "self.mnoteid"},
    {cascade_copy      => 0, cascade_delete => 0},
);

=head2 msg_ent_blacklists

Type: has_many

Related object: L<TMS::Schema::Result::MsgEntBlacklist>

=cut

__PACKAGE__->has_many(
    "msg_ent_blacklists", "TMS::Schema::Result::MsgEntBlacklist",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_ent_carriers

Type: has_many

Related object: L<TMS::Schema::Result::MsgEntCarrier>

=cut

__PACKAGE__->has_many(
    "msg_ent_carriers", "TMS::Schema::Result::MsgEntCarrier",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_ent_customers

Type: has_many

Related object: L<TMS::Schema::Result::MsgEntCustomer>

=cut

__PACKAGE__->has_many(
    "msg_ent_customers", "TMS::Schema::Result::MsgEntCustomer",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_ent_shippers

Type: has_many

Related object: L<TMS::Schema::Result::MsgEntShipper>

=cut

__PACKAGE__->has_many(
    "msg_ent_shippers", "TMS::Schema::Result::MsgEntShipper",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_entities

Type: has_many

Related object: L<TMS::Schema::Result::MsgEntity>

=cut

__PACKAGE__->has_many(
    "msg_entities",
    "TMS::Schema::Result::MsgEntity",
    {"foreign.mnoteid" => "self.mnoteid"},
    {cascade_copy      => 0, cascade_delete => 0},
);

=head2 msg_fin_billing_banks

Type: has_many

Related object: L<TMS::Schema::Result::MsgFinBillingBank>

=cut

__PACKAGE__->has_many(
    "msg_fin_billing_banks", "TMS::Schema::Result::MsgFinBillingBank",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_fin_billing_infos

Type: has_many

Related object: L<TMS::Schema::Result::MsgFinBillingInfo>

=cut

__PACKAGE__->has_many(
    "msg_fin_billing_infos", "TMS::Schema::Result::MsgFinBillingInfo",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_fin_billing_rules

Type: has_many

Related object: L<TMS::Schema::Result::MsgFinBillingRule>

=cut

__PACKAGE__->has_many(
    "msg_fin_billing_rules", "TMS::Schema::Result::MsgFinBillingRule",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_fin_invoices

Type: has_many

Related object: L<TMS::Schema::Result::MsgFinInvoice>

=cut

__PACKAGE__->has_many(
    "msg_fin_invoices", "TMS::Schema::Result::MsgFinInvoice",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_fin_invoices_items

Type: has_many

Related object: L<TMS::Schema::Result::MsgFinInvoicesItem>

=cut

__PACKAGE__->has_many(
    "msg_fin_invoices_items", "TMS::Schema::Result::MsgFinInvoicesItem",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_fin_item_templates

Type: has_many

Related object: L<TMS::Schema::Result::MsgFinItemTemplate>

=cut

__PACKAGE__->has_many(
    "msg_fin_item_templates", "TMS::Schema::Result::MsgFinItemTemplate",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_fin_item_templates_types

Type: has_many

Related object: L<TMS::Schema::Result::MsgFinItemTemplatesType>

=cut

__PACKAGE__->has_many(
    "msg_fin_item_templates_types", "TMS::Schema::Result::MsgFinItemTemplatesType",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_fin_scheduled_deductions

Type: has_many

Related object: L<TMS::Schema::Result::MsgFinScheduledDeduction>

=cut

__PACKAGE__->has_many(
    "msg_fin_scheduled_deductions", "TMS::Schema::Result::MsgFinScheduledDeduction",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_fin_tax_ids

Type: has_many

Related object: L<TMS::Schema::Result::MsgFinTaxId>

=cut

__PACKAGE__->has_many(
    "msg_fin_tax_ids",
    "TMS::Schema::Result::MsgFinTaxId",
    {"foreign.mnoteid" => "self.mnoteid"},
    {cascade_copy      => 0, cascade_delete => 0},
);

=head2 msg_fin_transactions

Type: has_many

Related object: L<TMS::Schema::Result::MsgFinTransaction>

=cut

__PACKAGE__->has_many(
    "msg_fin_transactions", "TMS::Schema::Result::MsgFinTransaction",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_gen_files

Type: has_many

Related object: L<TMS::Schema::Result::MsgGenFile>

=cut

__PACKAGE__->has_many(
    "msg_gen_files",
    "TMS::Schema::Result::MsgGenFile",
    {"foreign.mnoteid" => "self.mnoteid"},
    {cascade_copy      => 0, cascade_delete => 0},
);

=head2 msg_hr_associates

Type: has_many

Related object: L<TMS::Schema::Result::MsgHrAssociate>

=cut

__PACKAGE__->has_many(
    "msg_hr_associates", "TMS::Schema::Result::MsgHrAssociate",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_hr_emrgency_contacts

Type: has_many

Related object: L<TMS::Schema::Result::MsgHrEmrgencyContact>

=cut

__PACKAGE__->has_many(
    "msg_hr_emrgency_contacts", "TMS::Schema::Result::MsgHrEmrgencyContact",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_hr_references

Type: has_many

Related object: L<TMS::Schema::Result::MsgHrReference>

=cut

__PACKAGE__->has_many(
    "msg_hr_references", "TMS::Schema::Result::MsgHrReference",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_ins_to_entities

Type: has_many

Related object: L<TMS::Schema::Result::MsgInsToEntity>

=cut

__PACKAGE__->has_many(
    "msg_ins_to_entities", "TMS::Schema::Result::MsgInsToEntity",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_ins_to_vehicles

Type: has_many

Related object: L<TMS::Schema::Result::MsgInsToVehicle>

=cut

__PACKAGE__->has_many(
    "msg_ins_to_vehicles", "TMS::Schema::Result::MsgInsToVehicle",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_inv_notes

Type: has_many

Related object: L<TMS::Schema::Result::MsgInvNote>

=cut

__PACKAGE__->has_many(
    "msg_inv_notes",
    "TMS::Schema::Result::MsgInvNote",
    {"foreign.mnoteid" => "self.mnoteid"},
    {cascade_copy      => 0, cascade_delete => 0},
);

=head2 msg_inv_roles

Type: has_many

Related object: L<TMS::Schema::Result::MsgInvRole>

=cut

__PACKAGE__->has_many(
    "msg_inv_roles",
    "TMS::Schema::Result::MsgInvRole",
    {"foreign.mnoteid" => "self.mnoteid"},
    {cascade_copy      => 0, cascade_delete => 0},
);

=head2 msg_inv_support_vendors

Type: has_many

Related object: L<TMS::Schema::Result::MsgInvSupportVendor>

=cut

__PACKAGE__->has_many(
    "msg_inv_support_vendors", "TMS::Schema::Result::MsgInvSupportVendor",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_inv_units_to_equipments

Type: has_many

Related object: L<TMS::Schema::Result::MsgInvUnitsToEquipment>

=cut

__PACKAGE__->has_many(
    "msg_inv_units_to_equipments", "TMS::Schema::Result::MsgInvUnitsToEquipment",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_sft_logbooks

Type: has_many

Related object: L<TMS::Schema::Result::MsgSftLogbook>

=cut

__PACKAGE__->has_many(
    "msg_sft_logbooks", "TMS::Schema::Result::MsgSftLogbook",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_sft_vehicle_inspect_items

Type: has_many

Related object: L<TMS::Schema::Result::MsgSftVehicleInspectItem>

=cut

__PACKAGE__->has_many(
    "msg_sft_vehicle_inspect_items", "TMS::Schema::Result::MsgSftVehicleInspectItem",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_sft_vehicle_inspect_proofs

Type: has_many

Related object: L<TMS::Schema::Result::MsgSftVehicleInspectProof>

=cut

__PACKAGE__->has_many(
    "msg_sft_vehicle_inspect_proofs", "TMS::Schema::Result::MsgSftVehicleInspectProof",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_sft_vehicle_inspections

Type: has_many

Related object: L<TMS::Schema::Result::MsgSftVehicleInspection>

=cut

__PACKAGE__->has_many(
    "msg_sft_vehicle_inspections", "TMS::Schema::Result::MsgSftVehicleInspection",
    {"foreign.mnoteid" => "self.mnoteid"}, {cascade_copy => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 13:19:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GkDIhEkX/9CTea0W7F//GA
my $foreign_objs = [
    {   resultsource  => 'TMS::Schema::Result::CntAddress',
        primary_key   => 'AddrId',
        relation_name => 'msg_note_address'
    },
    {   resultsource  => 'TMS::Schema::Result::EntCarrier',
        primary_key   => 'CarrierId',
        relation_name => 'msg_note_carrier'
    }
];

foreach my $fobj (@$foreign_objs) {
    __PACKAGE__->belongs_to(
        $$fobj{relation_name},
        $$fobj{resultsource},
        sub {
            my $args = shift;
            return {"$args->{foreign_alias}.$$fobj{primary_key}" => "$args->{self_alias}.sourceid"};
        },
        {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
    );
}

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
