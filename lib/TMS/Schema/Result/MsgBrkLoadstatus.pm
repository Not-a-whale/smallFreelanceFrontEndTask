use utf8;

package TMS::Schema::Result::MsgBrkLoadstatus;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::MsgBrkLoadstatus

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<msg_brk_loadstatus>

=cut

__PACKAGE__->table("msg_brk_loadstatus");

=head1 ACCESSORS

=head2 idmsg_brk_loadstatus

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 mnoteid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 StatId

  accessor: 'stat_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "idmsg_brk_loadstatus",
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
    "StatId",
    {   accessor       => "stat_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</idmsg_brk_loadstatus>

=back

=cut

__PACKAGE__->set_primary_key("idmsg_brk_loadstatus");

=head1 UNIQUE CONSTRAINTS

=head2 C<msg_brk_loadstatus_unq>

=over 4

=item * L</mnoteid>

=item * L</StatId>

=back

=cut

__PACKAGE__->add_unique_constraint("msg_brk_loadstatus_unq", ["mnoteid", "StatId"]);

=head1 RELATIONS

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

=head2 stat

Type: belongs_to

Related object: L<TMS::Schema::Result::BrkLoadstatus>

=cut

__PACKAGE__->belongs_to(
    "stat",
    "TMS::Schema::Result::BrkLoadstatus",
    {StatId        => "StatId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 20:08:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:QmeBSBatBpgAVJTjkHqx/A

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
