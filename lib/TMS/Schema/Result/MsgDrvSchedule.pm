use utf8;

package TMS::Schema::Result::MsgDrvSchedule;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::MsgDrvSchedule

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<msg_drv_schedules>

=cut

__PACKAGE__->table("msg_drv_schedules");

=head1 ACCESSORS

=head2 idmsg_drv_schedules

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 mnoteid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DrvSchdId

  accessor: 'drv_schd_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "idmsg_drv_schedules",
    {   data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "mnoteid",
    {   data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "DrvSchdId",
    {   accessor       => "drv_schd_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</idmsg_drv_schedules>

=back

=cut

__PACKAGE__->set_primary_key("idmsg_drv_schedules");

=head1 UNIQUE CONSTRAINTS

=head2 C<msg_drv_schedules_unq>

=over 4

=item * L</mnoteid>

=item * L</DrvSchdId>

=back

=cut

__PACKAGE__->add_unique_constraint("msg_drv_schedules_unq", ["mnoteid", "DrvSchdId"]);

=head1 RELATIONS

=head2 drv_schd

Type: belongs_to

Related object: L<TMS::Schema::Result::DrvSchedule>

=cut

__PACKAGE__->belongs_to(
    "drv_schd",
    "TMS::Schema::Result::DrvSchedule",
    {DrvSchdId     => "DrvSchdId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 mnoteid

Type: belongs_to

Related object: L<TMS::Schema::Result::MsgNote>

=cut

__PACKAGE__->belongs_to(
    "mnoteid",
    "TMS::Schema::Result::MsgNote",
    {mnoteid       => "mnoteid"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 13:19:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/+0fgy4TW8jdAj8vqvj48w

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
