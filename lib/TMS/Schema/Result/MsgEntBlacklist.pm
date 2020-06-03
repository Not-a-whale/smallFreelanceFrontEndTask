use utf8;

package TMS::Schema::Result::MsgEntBlacklist;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::MsgEntBlacklist

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<msg_ent_blacklist>

=cut

__PACKAGE__->table("msg_ent_blacklist");

=head1 ACCESSORS

=head2 idmsg_ent_blacklist

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 mnoteid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 BlackListId

  accessor: 'black_list_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "idmsg_ent_blacklist",
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
    "BlackListId",
    {   accessor       => "black_list_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</idmsg_ent_blacklist>

=back

=cut

__PACKAGE__->set_primary_key("idmsg_ent_blacklist");

=head1 UNIQUE CONSTRAINTS

=head2 C<msg_ent_blacklist_unq>

=over 4

=item * L</mnoteid>

=item * L</BlackListId>

=back

=cut

__PACKAGE__->add_unique_constraint("msg_ent_blacklist_unq", ["mnoteid", "BlackListId"]);

=head1 RELATIONS

=head2 black_list

Type: belongs_to

Related object: L<TMS::Schema::Result::EntBlacklist>

=cut

__PACKAGE__->belongs_to(
    "black_list",
    "TMS::Schema::Result::EntBlacklist",
    {BlackListId   => "BlackListId"},
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

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 20:08:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2xo04PFegTcLrDssBRZOXg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
