use utf8;
package TMS::Schema::Result::SftVehicleRegistration;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::SftVehicleRegistration

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<sft_vehicle_registration>

=cut

__PACKAGE__->table("sft_vehicle_registration");

=head1 ACCESSORS

=head2 RegistrationId

  accessor: 'registration_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 VehicleId

  accessor: 'vehicle_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 PlateNumber

  accessor: 'plate_number'
  data_type: 'varchar'
  is_nullable: 0
  size: 16

=head2 State

  accessor: 'state'
  data_type: 'varchar'
  is_nullable: 0
  size: 2

=head2 DateRegistration

  accessor: 'date_registration'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 DateExpiration

  accessor: 'date_expiration'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 ProRate

  accessor: 'pro_rate'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

vehicle has international tag

=cut

__PACKAGE__->add_columns(
  "RegistrationId",
  {
    accessor    => "registration_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 0,
  },
  "VehicleId",
  {
    accessor       => "vehicle_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "PlateNumber",
  {
    accessor => "plate_number",
    data_type => "varchar",
    is_nullable => 0,
    size => 16,
  },
  "State",
  { accessor => "state", data_type => "varchar", is_nullable => 0, size => 2 },
  "DateRegistration",
  {
    accessor => "date_registration",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "DateExpiration",
  {
    accessor => "date_expiration",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "ProRate",
  {
    accessor      => "pro_rate",
    data_type     => "tinyint",
    default_value => 0,
    extra         => { unsigned => 1 },
    is_nullable   => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</RegistrationId>

=back

=cut

__PACKAGE__->set_primary_key("RegistrationId");

=head1 UNIQUE CONSTRAINTS

=head2 C<PlateNumber_UNIQUE>

=over 4

=item * L</PlateNumber>

=back

=cut

__PACKAGE__->add_unique_constraint("PlateNumber_UNIQUE", ["PlateNumber"]);

=head1 RELATIONS

=head2 vehicle

Type: belongs_to

Related object: L<TMS::Schema::Result::InvVehicle>

=cut

__PACKAGE__->belongs_to(
  "vehicle",
  "TMS::Schema::Result::InvVehicle",
  { VehicleId => "VehicleId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-13 13:34:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kiAY3/etPiZxZhOpgKvN4w


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;