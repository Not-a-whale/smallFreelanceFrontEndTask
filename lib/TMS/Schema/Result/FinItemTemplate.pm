use utf8;

package TMS::Schema::Result::FinItemTemplate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinItemTemplate

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_item_template>

=cut

__PACKAGE__->table("fin_item_template");

=head1 ACCESSORS

=head2 ItemTemplateId

  accessor: 'item_template_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 TemplateTypeId

  accessor: 'template_type_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 EntityId

  accessor: 'entity_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 DebitAccountId

  accessor: 'debit_account_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 CreditAccountId

  accessor: 'credit_account_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 CreatedBy

  accessor: 'created_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 ParentId

  accessor: 'parent_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

For AFTER INSERT trigger functionality

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 Price

  accessor: 'price'
  data_type: 'decimal'
  extra: {unsigned => 1}
  is_nullable: 1
  size: [12,2]

=head2 UserDefined

  accessor: 'user_defined'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 PriceType

  accessor: 'price_type'
  data_type: 'enum'
  extra: {list => ["flat rate","percentage"]}
  is_nullable: 1

=head2 Name

  accessor: 'name'
  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 Description

  accessor: 'description'
  data_type: 'text'
  is_nullable: 1

=head2 Deleted

  accessor: 'deleted'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 DeletedBy

  accessor: 'deleted_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 DateDeleted

  accessor: 'date_deleted'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 UpdatedBy

  accessor: 'updated_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 DateUpdated

  accessor: 'date_updated'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 TransactionType

  accessor: 'transaction_type'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "ItemTemplateId",
    {   accessor          => "item_template_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "TemplateTypeId",
    {   accessor       => "template_type_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "EntityId",
    {   accessor       => "entity_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "DebitAccountId",
    {   accessor       => "debit_account_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "CreditAccountId",
    {   accessor       => "credit_account_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "CreatedBy",
    {   accessor       => "created_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "ParentId",
    {   accessor       => "parent_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "DateCreated",
    {   accessor                  => "date_created",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "Price",
    {   accessor    => "price",
        data_type   => "decimal",
        extra       => {unsigned => 1},
        is_nullable => 1,
        size        => [12, 2],
    },
    "UserDefined",
    {   accessor      => "user_defined",
        data_type     => "tinyint",
        default_value => 1,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
    "PriceType",
    {   accessor    => "price_type",
        data_type   => "enum",
        extra       => {list => ["flat rate", "percentage"]},
        is_nullable => 1,
    },
    "Name",
    {accessor => "name", data_type => "varchar", is_nullable => 0, size => 1024},
    "Description",
    {accessor => "description", data_type => "text", is_nullable => 1},
    "Deleted",
    {   accessor      => "deleted",
        data_type     => "tinyint",
        default_value => 0,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
    "DeletedBy",
    {   accessor       => "deleted_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "DateDeleted",
    {   accessor                  => "date_deleted",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "UpdatedBy",
    {   accessor       => "updated_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "DateUpdated",
    {   accessor                  => "date_updated",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "TransactionType",
    {   accessor       => "transaction_type",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</ItemTemplateId>

=back

=cut

__PACKAGE__->set_primary_key("ItemTemplateId");

=head1 UNIQUE CONSTRAINTS

=head2 C<Name_UNIQUE>

=over 4

=item * L</Name>

=back

=cut

__PACKAGE__->add_unique_constraint("Name_UNIQUE", ["Name"]);

=head1 RELATIONS

=head2 created_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "created_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId => "CreatedBy"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 credit_account

Type: belongs_to

Related object: L<TMS::Schema::Result::FinAccount>

=cut

__PACKAGE__->belongs_to(
    "credit_account",
    "TMS::Schema::Result::FinAccount",
    {AccountId => "CreditAccountId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 debit_account

Type: belongs_to

Related object: L<TMS::Schema::Result::FinAccount>

=cut

__PACKAGE__->belongs_to(
    "debit_account",
    "TMS::Schema::Result::FinAccount",
    {AccountId => "DebitAccountId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 deleted_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "deleted_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId => "DeletedBy"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 entity

Type: belongs_to

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->belongs_to(
    "entity",
    "TMS::Schema::Result::Entity",
    {EntityId => "EntityId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 fin_invoices_items

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoicesItem>

=cut

__PACKAGE__->has_many(
    "fin_invoices_items",
    "TMS::Schema::Result::FinInvoicesItem",
    {"foreign.ItemTemplateId" => "self.ItemTemplateId"},
    {cascade_copy             => 0, cascade_delete => 0},
);

=head2 fin_item_templates

Type: has_many

Related object: L<TMS::Schema::Result::FinItemTemplate>

=cut

__PACKAGE__->has_many(
    "fin_item_templates",
    "TMS::Schema::Result::FinItemTemplate",
    {"foreign.ParentId" => "self.ItemTemplateId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

=head2 fin_item_templates_trees_ancestors

Type: has_many

Related object: L<TMS::Schema::Result::FinItemTemplatesTree>

=cut

__PACKAGE__->has_many(
    "fin_item_templates_trees_ancestors", "TMS::Schema::Result::FinItemTemplatesTree",
    {"foreign.AncestorId" => "self.ItemTemplateId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_item_templates_trees_descendants

Type: has_many

Related object: L<TMS::Schema::Result::FinItemTemplatesTree>

=cut

__PACKAGE__->has_many(
    "fin_item_templates_trees_descendants", "TMS::Schema::Result::FinItemTemplatesTree",
    {"foreign.DescendantId" => "self.ItemTemplateId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_scheduled_deductions

Type: has_many

Related object: L<TMS::Schema::Result::FinScheduledDeduction>

=cut

__PACKAGE__->has_many(
    "fin_scheduled_deductions", "TMS::Schema::Result::FinScheduledDeduction",
    {"foreign.ItemTemplateId" => "self.ItemTemplateId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 parent

Type: belongs_to

Related object: L<TMS::Schema::Result::FinItemTemplate>

=cut

__PACKAGE__->belongs_to(
    "parent",
    "TMS::Schema::Result::FinItemTemplate",
    {ItemTemplateId => "ParentId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 template_type

Type: belongs_to

Related object: L<TMS::Schema::Result::FinItemTemplatesType>

=cut

__PACKAGE__->belongs_to(
    "template_type",
    "TMS::Schema::Result::FinItemTemplatesType",
    {TemplateTypeId => "TemplateTypeId"},
    {is_deferrable  => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 transaction_type

Type: belongs_to

Related object: L<TMS::Schema::Result::FinTransactionType>

=cut

__PACKAGE__->belongs_to(
    "transaction_type",
    "TMS::Schema::Result::FinTransactionType",
    {TransTypeId => "TransactionType"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 updated_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "updated_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId => "UpdatedBy"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 09:43:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LpOwrFPm7JLP2424fWK16Q

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
