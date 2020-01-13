use utf8;

package TMS::Schema::Result::DrvMedcard;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DrvMedcard

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<drv_medcards>

=cut

__PACKAGE__->table("drv_medcards");

=head1 ACCESSORS

=head2 MedCardId

  accessor: 'med_card_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 DriverId

  accessor: 'driver_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Photo

  accessor: 'photo'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 ExpirationDate

  accessor: 'expiration_date'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "MedCardId",
    {   accessor          => "med_card_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "DriverId",
    {   accessor       => "driver_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "Photo",
    {   accessor       => "photo",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "ExpirationDate",
    {   accessor                  => "expiration_date",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</MedCardId>

=back

=cut

__PACKAGE__->set_primary_key("MedCardId");

=head1 RELATIONS

=head2 driver

Type: belongs_to

Related object: L<TMS::Schema::Result::DrvDriver>

=cut

__PACKAGE__->belongs_to(
    "driver",
    "TMS::Schema::Result::DrvDriver",
    {DriverId      => "DriverId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 photo

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
    "photo",
    "TMS::Schema::Result::GenFile",
    {FileId        => "Photo"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 15:30:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6AGdVKefrISMm03YCV1GtA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
