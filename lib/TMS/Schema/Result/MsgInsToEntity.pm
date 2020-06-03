use utf8;

package TMS::Schema::Result::MsgInsToEntity;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::MsgInsToEntity

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<msg_ins_to_entities>

=cut

__PACKAGE__->table("msg_ins_to_entities");

=head1 ACCESSORS

=head2 idmsg_ins_to_entities

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 mnoteid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 InsEntId

  accessor: 'ins_ent_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "idmsg_ins_to_entities",
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
    "InsEntId",
    {   accessor       => "ins_ent_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</idmsg_ins_to_entities>

=back

=cut

__PACKAGE__->set_primary_key("idmsg_ins_to_entities");

=head1 UNIQUE CONSTRAINTS

=head2 C<msg_ins_to_entities_unq>

=over 4

=item * L</mnoteid>

=item * L</InsEntId>

=back

=cut

__PACKAGE__->add_unique_constraint("msg_ins_to_entities_unq", ["mnoteid", "InsEntId"]);

=head1 RELATIONS

=head2 ins_ent

Type: belongs_to

Related object: L<TMS::Schema::Result::InsToEntity>

=cut

__PACKAGE__->belongs_to(
    "ins_ent",
    "TMS::Schema::Result::InsToEntity",
    {InsEntId      => "InsEntId"},
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:QUOgLbZ0b+tdg0El4YpD+g

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
