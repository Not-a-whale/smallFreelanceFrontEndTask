use utf8;

package TMS::Schema::Result::DrvSchedule;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DrvSchedule

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<drv_schedules>

=cut

__PACKAGE__->table("drv_schedules");

=head1 ACCESSORS

=head2 DrvSchdId

  accessor: 'drv_schd_id'
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

=head2 ChangeDate

  accessor: 'change_date'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 DesiredDestId

  accessor: 'desired_dest_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DesiredDestNote

  accessor: 'desired_dest_note'
  data_type: 'text'
  is_nullable: 1

=head2 PostedBy

  accessor: 'posted_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 PostedDate

  accessor: 'posted_date'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "DrvSchdId",
    {   accessor          => "drv_schd_id",
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
    "ChangeDate",
    {   accessor                  => "change_date",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "DesiredDestId",
    {   accessor       => "desired_dest_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "DesiredDestNote",
    {accessor => "desired_dest_note", data_type => "text", is_nullable => 1},
    "PostedBy",
    {   accessor       => "posted_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "PostedDate",
    {   accessor                  => "posted_date",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</DrvSchdId>

=back

=cut

__PACKAGE__->set_primary_key("DrvSchdId");

=head1 RELATIONS

=head2 desired_dest

Type: belongs_to

Related object: L<TMS::Schema::Result::DrvDesttype>

=cut

__PACKAGE__->belongs_to(
    "desired_dest",
    "TMS::Schema::Result::DrvDesttype",
    {DesiredDestId => "DesiredDestId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
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

=head2 posted_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "posted_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "PostedBy"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 09:43:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:w7sxlbI543w32JWbrdFnlA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
