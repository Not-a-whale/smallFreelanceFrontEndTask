use utf8;
package TMS::Schema::Result::FinVendor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinVendor

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_vendors>

=cut

__PACKAGE__->table("fin_vendors");

=head1 ACCESSORS

=head2 EntityId

  accessor: 'entity_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Type

  accessor: 'type'
  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 Is1099

  accessor: 'is1099'
  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 TaxId

  accessor: 'tax_id'
  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 RefNumber

  accessor: 'ref_number'
  data_type: 'varchar'
  is_nullable: 0
  size: 16

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=head2 Terms

  accessor: 'terms'
  data_type: 'varchar'
  is_nullable: 1
  size: 45

=cut

__PACKAGE__->add_columns(
  "EntityId",
  {
    accessor       => "entity_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "Type",
  { accessor => "type", data_type => "varchar", is_nullable => 1, size => 128 },
  "Is1099",
  {
    accessor      => "is1099",
    data_type     => "tinyint",
    default_value => 0,
    is_nullable   => 0,
  },
  "TaxId",
  { accessor => "tax_id", data_type => "varchar", is_nullable => 1, size => 45 },
  "RefNumber",
  {
    accessor => "ref_number",
    data_type => "varchar",
    is_nullable => 0,
    size => 16,
  },
  "Notes",
  { accessor => "notes", data_type => "text", is_nullable => 1 },
  "Terms",
  { accessor => "terms", data_type => "varchar", is_nullable => 1, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</EntityId>

=back

=cut

__PACKAGE__->set_primary_key("EntityId");

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


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 15:51:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XtputcUqpgBuAC3cCBRIvw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;