use utf8;
package TMS::Schema::Result::InsToEntity;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InsToEntity

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<ins_to_entities>

=cut

__PACKAGE__->table("ins_to_entities");

=head1 ACCESSORS

=head2 InsId

  accessor: 'ins_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 EntityId

  accessor: 'entity_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DateAdded

  accessor: 'date_added'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "InsId",
  {
    accessor       => "ins_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "EntityId",
  {
    accessor       => "entity_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "DateAdded",
  {
    accessor => "date_added",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</InsId>

=item * L</EntityId>

=back

=cut

__PACKAGE__->set_primary_key("InsId", "EntityId");

=head1 RELATIONS

=head2 entity

Type: belongs_to

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->belongs_to(
  "entity",
  "TMS::Schema::Result::Entity",
  { EntityId => "EntityId" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 in

Type: belongs_to

Related object: L<TMS::Schema::Result::InsPolicy>

=cut

__PACKAGE__->belongs_to(
  "in",
  "TMS::Schema::Result::InsPolicy",
  { InsId => "InsId" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2fN2FEmeGx5LxwSGf2UOzw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;