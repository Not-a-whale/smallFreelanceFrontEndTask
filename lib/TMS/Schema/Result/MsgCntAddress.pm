use utf8;

package TMS::Schema::Result::MsgCntAddress;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::MsgCntAddress

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<msg_cnt_addresses>

=cut

__PACKAGE__->table("msg_cnt_addresses");

=head1 ACCESSORS

=head2 idmsg_cnt_addresses

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 mnoteid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 AddrId

  accessor: 'addr_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "idmsg_cnt_addresses",
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
    "AddrId",
    {   accessor       => "addr_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</idmsg_cnt_addresses>

=back

=cut

__PACKAGE__->set_primary_key("idmsg_cnt_addresses");

=head1 UNIQUE CONSTRAINTS

=head2 C<msg_cnt_addresses_unq>

=over 4

=item * L</mnoteid>

=item * L</AddrId>

=back

=cut

__PACKAGE__->add_unique_constraint("msg_cnt_addresses_unq", ["mnoteid", "AddrId"]);

=head1 RELATIONS

=head2 addr

Type: belongs_to

Related object: L<TMS::Schema::Result::CntAddress>

=cut

__PACKAGE__->belongs_to(
    "addr",
    "TMS::Schema::Result::CntAddress",
    {AddrId        => "AddrId"},
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Tnf5VCjEgjautdubATr9Dg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
