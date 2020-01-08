use utf8;

package TMS::Schema::Result::CrrIftaDecal;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::CrrIftaDecal

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<crr_ifta_decal>

=cut

__PACKAGE__->table("crr_ifta_decal");

=head1 ACCESSORS

=head2 DecalId

  accessor: 'decal_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 IftaAcctId

  accessor: 'ifta_acct_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DecalNo

  accessor: 'decal_no'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 DecalImg

  accessor: 'decal_img'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 VehicleId

  accessor: 'vehicle_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 EffectiveDate

  accessor: 'effective_date'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 ExpirationDate

  accessor: 'expiration_date'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 DateIssued

  accessor: 'date_issued'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 CreatedBy

  accessor: 'created_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "DecalId",
    {   accessor          => "decal_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "IftaAcctId",
    {   accessor       => "ifta_acct_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "DecalNo",
    {   accessor    => "decal_no",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
    "DecalImg",
    {   accessor       => "decal_img",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "VehicleId",
    {   accessor       => "vehicle_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "EffectiveDate",
    {   accessor                  => "effective_date",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "ExpirationDate",
    {   accessor                  => "expiration_date",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "DateIssued",
    {   accessor                  => "date_issued",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "CreatedBy",
    {   accessor       => "created_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</DecalId>

=back

=cut

__PACKAGE__->set_primary_key("DecalId");

=head1 RELATIONS

=head2 created_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "created_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId => "CreatedBy"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 decal_img

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
    "decal_img",
    "TMS::Schema::Result::GenFile",
    {FileId        => "DecalImg"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 ifta_acct

Type: belongs_to

Related object: L<TMS::Schema::Result::CrrIfta>

=cut

__PACKAGE__->belongs_to(
    "ifta_acct",
    "TMS::Schema::Result::CrrIfta",
    {IftaAcctId    => "IftaAcctId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 vehicle

Type: belongs_to

Related object: L<TMS::Schema::Result::InvVehicle>

=cut

__PACKAGE__->belongs_to(
    "vehicle",
    "TMS::Schema::Result::InvVehicle",
    {VehicleId     => "VehicleId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 08:23:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rJf/pfcCAHlJgjelIoFOfA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
