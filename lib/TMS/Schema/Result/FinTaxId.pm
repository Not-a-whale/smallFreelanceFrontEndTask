use utf8;

package TMS::Schema::Result::FinTaxId;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinTaxId

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_tax_ids>

=cut

__PACKAGE__->table("fin_tax_ids");

=head1 ACCESSORS

=head2 EntityId

  accessor: 'entity_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Photo

  accessor: 'photo'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 Tax_ID

  accessor: 'tax_id'
  data_type: 'char'
  is_nullable: 0
  size: 16

=head2 ID_Type

  accessor: 'id_type'
  data_type: 'enum'
  extra: {list => ["SSN","EIN","ITIN"]}
  is_nullable: 0

=head2 Entered

  accessor: 'entered'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 1

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=head2 Need1099

  accessor: 'need1099'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "EntityId",
    {   accessor       => "entity_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "Photo",
    {   accessor       => "photo",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "Tax_ID",
    {accessor => "tax_id", data_type => "char", is_nullable => 0, size => 16},
    "ID_Type",
    {   accessor    => "id_type",
        data_type   => "enum",
        extra       => {list => ["SSN", "EIN", "ITIN"]},
        is_nullable => 0,
    },
    "Entered",
    {   accessor                  => "entered",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 1,
    },
    "Notes",
    {accessor => "notes", data_type => "text", is_nullable => 1},
    "Need1099",
    {   accessor      => "need1099",
        data_type     => "tinyint",
        default_value => 0,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</EntityId>

=back

=cut

__PACKAGE__->set_primary_key("EntityId");

=head1 UNIQUE CONSTRAINTS

=head2 C<Tax_ID_UNIQUE>

=over 4

=item * L</Tax_ID>

=back

=cut

__PACKAGE__->add_unique_constraint("Tax_ID_UNIQUE", ["Tax_ID"]);

=head1 RELATIONS

=head2 entity

Type: belongs_to

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->belongs_to(
    "entity", "TMS::Schema::Result::Entity",
    {EntityId      => "EntityId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 photo

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
    "photo",
    "TMS::Schema::Result::GenFile",
    {FileId => "Photo"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-24 07:43:32
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TYdmLWtK4JBv8G270AkBuA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
