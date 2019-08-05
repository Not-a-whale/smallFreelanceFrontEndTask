use utf8;
package TMS::Schema::Result::EntCarrier;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::EntCarrier

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<ent_carriers>

=cut

__PACKAGE__->table("ent_carriers");

=head1 ACCESSORS

=head2 CarrierId

  accessor: 'carrier_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 MC

  accessor: 'mc'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 McCertificatePhoto

  accessor: 'mc_certificate_photo'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 DOT

  accessor: 'dot'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 CrType

  accessor: 'cr_type'
  data_type: 'enum'
  extra: {list => ["Company Carrier","Brokerage Only"]}
  is_nullable: 1

=head2 IFTA_Acc

  accessor: 'ifta_acc'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 IFTA_State

  accessor: 'ifta_state'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 SCAC

  accessor: 'scac'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 state_OR

  accessor: 'state_or'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 state_NY

  accessor: 'state_ny'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 state_NC

  accessor: 'state_nc'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 state_SC

  accessor: 'state_sc'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 state_NM

  accessor: 'state_nm'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 state_KY

  accessor: 'state_ky'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 state_FL

  accessor: 'state_fl'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "CarrierId",
  {
    accessor       => "carrier_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "MC",
  { accessor => "mc", data_type => "varchar", is_nullable => 1, size => 255 },
  "McCertificatePhoto",
  {
    accessor       => "mc_certificate_photo",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "DOT",
  { accessor => "dot", data_type => "varchar", is_nullable => 1, size => 255 },
  "CrType",
  {
    accessor    => "cr_type",
    data_type   => "enum",
    extra       => { list => ["Company Carrier", "Brokerage Only"] },
    is_nullable => 1,
  },
  "IFTA_Acc",
  {
    accessor => "ifta_acc",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "IFTA_State",
  {
    accessor       => "ifta_state",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "SCAC",
  { accessor => "scac", data_type => "varchar", is_nullable => 1, size => 255 },
  "state_OR",
  {
    accessor => "state_or",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "state_NY",
  {
    accessor => "state_ny",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "state_NC",
  {
    accessor => "state_nc",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "state_SC",
  {
    accessor => "state_sc",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "state_NM",
  {
    accessor => "state_nm",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "state_KY",
  {
    accessor => "state_ky",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "state_FL",
  {
    accessor => "state_fl",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</CarrierId>

=back

=cut

__PACKAGE__->set_primary_key("CarrierId");

=head1 UNIQUE CONSTRAINTS

=head2 C<DOT_UNIQUE>

=over 4

=item * L</DOT>

=back

=cut

__PACKAGE__->add_unique_constraint("DOT_UNIQUE", ["DOT"]);

=head2 C<MC_UNIQUE>

=over 4

=item * L</MC>

=back

=cut

__PACKAGE__->add_unique_constraint("MC_UNIQUE", ["MC"]);

=head2 C<SCAC_UNIQUE>

=over 4

=item * L</SCAC>

=back

=cut

__PACKAGE__->add_unique_constraint("SCAC_UNIQUE", ["SCAC"]);

=head1 RELATIONS

=head2 carrier

Type: belongs_to

Related object: L<TMS::Schema::Result::EntBusiness>

=cut

__PACKAGE__->belongs_to(
  "carrier",
  "TMS::Schema::Result::EntBusiness",
  { BizId => "CarrierId" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 ifta_state

Type: belongs_to

Related object: L<TMS::Schema::Result::CntState>

=cut

__PACKAGE__->belongs_to(
  "ifta_state",
  "TMS::Schema::Result::CntState",
  { StateId => "IFTA_State" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);

=head2 inv_vehicles

Type: has_many

Related object: L<TMS::Schema::Result::InvVehicle>

=cut

__PACKAGE__->has_many(
  "inv_vehicles",
  "TMS::Schema::Result::InvVehicle",
  { "foreign.CarrierId" => "self.CarrierId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 mc_certificate_photo

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
  "mc_certificate_photo",
  "TMS::Schema::Result::GenFile",
  { FileId => "McCertificatePhoto" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ny9DPeoaS34gU9nqYmYK5A


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;