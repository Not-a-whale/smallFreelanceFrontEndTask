use utf8;

package TMS::Schema::Result::DrvDriverlicence;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DrvDriverlicence

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<drv_driverlicences>

=cut

__PACKAGE__->table("drv_driverlicences");

=head1 ACCESSORS

=head2 DrLcId

  accessor: 'dr_lc_id'
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

=head2 DrLicNumber

  accessor: 'dr_lic_number'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 DrLcDateValid

  accessor: 'dr_lc_date_valid'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 DrLcDateExpired

  accessor: 'dr_lc_date_expired'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 DrLcSate

  accessor: 'dr_lc_sate'
  data_type: 'char'
  is_nullable: 0
  size: 2

=head2 DrLcEndorsement

  accessor: 'dr_lc_endorsement'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 Photo

  accessor: 'photo'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "DrLcId",
    {   accessor          => "dr_lc_id",
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
    "DrLicNumber",
    {   accessor    => "dr_lic_number",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
    "DrLcDateValid",
    {   accessor                  => "dr_lc_date_valid",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "DrLcDateExpired",
    {   accessor                  => "dr_lc_date_expired",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "DrLcSate",
    {accessor => "dr_lc_sate", data_type => "char", is_nullable => 0, size => 2},
    "DrLcEndorsement",
    {   accessor       => "dr_lc_endorsement",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "Photo",
    {   accessor       => "photo",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</DrLcId>

=back

=cut

__PACKAGE__->set_primary_key("DrLcId");

=head1 RELATIONS

=head2 dr_lc_endorsement

Type: belongs_to

Related object: L<TMS::Schema::Result::DrvCdlEndorsement>

=cut

__PACKAGE__->belongs_to(
    "dr_lc_endorsement",
    "TMS::Schema::Result::DrvCdlEndorsement",
    {EndrsId => "DrLcEndorsement"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

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

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-03-10 16:28:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UTL8sVekP85BtBxMlNd0bw

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
