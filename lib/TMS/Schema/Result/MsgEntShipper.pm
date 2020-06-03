use utf8;

package TMS::Schema::Result::MsgEntShipper;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::MsgEntShipper

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<msg_ent_shippers>

=cut

__PACKAGE__->table("msg_ent_shippers");

=head1 ACCESSORS

=head2 idmsg_ent_shippers

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 mnoteid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 ShipperId

  accessor: 'shipper_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "idmsg_ent_shippers",
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
    "ShipperId",
    {   accessor       => "shipper_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</idmsg_ent_shippers>

=back

=cut

__PACKAGE__->set_primary_key("idmsg_ent_shippers");

=head1 UNIQUE CONSTRAINTS

=head2 C<msg_ent_shippers_unq>

=over 4

=item * L</mnoteid>

=item * L</ShipperId>

=back

=cut

__PACKAGE__->add_unique_constraint("msg_ent_shippers_unq", ["mnoteid", "ShipperId"]);

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

=head2 shipper

Type: belongs_to

Related object: L<TMS::Schema::Result::EntShipper>

=cut

__PACKAGE__->belongs_to(
    "shipper",
    "TMS::Schema::Result::EntShipper",
    {ShipperId     => "ShipperId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 20:08:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lhw1sfg+V355zxRFboE8YQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
