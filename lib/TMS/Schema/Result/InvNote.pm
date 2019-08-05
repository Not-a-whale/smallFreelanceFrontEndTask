use utf8;
package TMS::Schema::Result::InvNote;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InvNote

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<inv_notes>

=cut

__PACKAGE__->table("inv_notes");

=head1 ACCESSORS

=head2 EqNoteId

  accessor: 'eq_note_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 EquipmentId

  accessor: 'equipment_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 PostedBy

  accessor: 'posted_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "EqNoteId",
  {
    accessor => "eq_note_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "EquipmentId",
  {
    accessor       => "equipment_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "DateCreated",
  {
    accessor => "date_created",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
  "PostedBy",
  {
    accessor       => "posted_by",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "Notes",
  { accessor => "notes", data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</EqNoteId>

=back

=cut

__PACKAGE__->set_primary_key("EqNoteId");

=head1 RELATIONS

=head2 equipment

Type: belongs_to

Related object: L<TMS::Schema::Result::InvEquipment>

=cut

__PACKAGE__->belongs_to(
  "equipment",
  "TMS::Schema::Result::InvEquipment",
  { EquipmentId => "EquipmentId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 posted_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
  "posted_by",
  "TMS::Schema::Result::HrAssociate",
  { AstId => "PostedBy" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:IDEyMSR0HA/f03MF82a9Nw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;