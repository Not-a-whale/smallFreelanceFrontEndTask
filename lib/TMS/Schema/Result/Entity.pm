use utf8;

package TMS::Schema::Result::Entity;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::Entity

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<entities>

=cut

__PACKAGE__->table("entities");

=head1 ACCESSORS

=head2 EntityId

  accessor: 'entity_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 IsActive

  accessor: 'is_active'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

Boolean

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=head2 PersonId

  accessor: 'person_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 BusinessId

  accessor: 'business_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "EntityId",
    {   accessor          => "entity_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "IsActive",
    {   accessor      => "is_active",
        data_type     => "tinyint",
        default_value => 1,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
    "DateCreated",
    {   accessor                  => "date_created",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "Notes",
    {accessor => "notes", data_type => "text", is_nullable => 1},
    "PersonId",
    {   accessor       => "person_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "BusinessId",
    {   accessor       => "business_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</EntityId>

=back

=cut

__PACKAGE__->set_primary_key("EntityId");

=head1 UNIQUE CONSTRAINTS

=head2 C<BusinessId_UNIQUE>

=over 4

=item * L</BusinessId>

=back

=cut

__PACKAGE__->add_unique_constraint("BusinessId_UNIQUE", ["BusinessId"]);

=head2 C<PersonId_UNIQUE>

=over 4

=item * L</PersonId>

=back

=cut

__PACKAGE__->add_unique_constraint("PersonId_UNIQUE", ["PersonId"]);

=head1 RELATIONS

=head2 business

Type: belongs_to

Related object: L<TMS::Schema::Result::EntBusiness>

=cut

__PACKAGE__->belongs_to(
    "business",
    "TMS::Schema::Result::EntBusiness",
    {BizId => "BusinessId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "CASCADE",
        on_update     => "CASCADE",
    },
);

=head2 ent_blacklists

Type: has_many

Related object: L<TMS::Schema::Result::EntBlacklist>

=cut

__PACKAGE__->has_many(
    "ent_blacklists",
    "TMS::Schema::Result::EntBlacklist",
    {"foreign.EntityId" => "self.EntityId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

=head2 fin_billing_infos

Type: has_many

Related object: L<TMS::Schema::Result::FinBillingInfo>

=cut

__PACKAGE__->has_many(
    "fin_billing_infos", "TMS::Schema::Result::FinBillingInfo",
    {"foreign.EntityId" => "self.EntityId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_cheques_payees

Type: has_many

Related object: L<TMS::Schema::Result::FinCheque>

=cut

__PACKAGE__->has_many(
    "fin_cheques_payees", "TMS::Schema::Result::FinCheque",
    {"foreign.Payee" => "self.EntityId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_cheques_payers

Type: has_many

Related object: L<TMS::Schema::Result::FinCheque>

=cut

__PACKAGE__->has_many(
    "fin_cheques_payers", "TMS::Schema::Result::FinCheque",
    {"foreign.Payer" => "self.EntityId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_invoice_payments

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoicePayment>

=cut

__PACKAGE__->has_many(
    "fin_invoice_payments", "TMS::Schema::Result::FinInvoicePayment",
    {"foreign.PayerId" => "self.EntityId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_invoices

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoice>

=cut

__PACKAGE__->has_many(
    "fin_invoices",
    "TMS::Schema::Result::FinInvoice",
    {"foreign.EntityId" => "self.EntityId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

=head2 fin_item_templates

Type: has_many

Related object: L<TMS::Schema::Result::FinItemTemplate>

=cut

__PACKAGE__->has_many(
    "fin_item_templates", "TMS::Schema::Result::FinItemTemplate",
    {"foreign.EntityId" => "self.EntityId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_journal_entries

Type: has_many

Related object: L<TMS::Schema::Result::FinJournalEntry>

=cut

__PACKAGE__->has_many(
    "fin_journal_entries", "TMS::Schema::Result::FinJournalEntry",
    {"foreign.EntityId" => "self.EntityId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_scheduled_deductions

Type: has_many

Related object: L<TMS::Schema::Result::FinScheduledDeduction>

=cut

__PACKAGE__->has_many(
    "fin_scheduled_deductions", "TMS::Schema::Result::FinScheduledDeduction",
    {"foreign.EntityId" => "self.EntityId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_tax_id

Type: might_have

Related object: L<TMS::Schema::Result::FinTaxId>

=cut

__PACKAGE__->might_have(
    "fin_tax_id",
    "TMS::Schema::Result::FinTaxId",
    {"foreign.EntityId" => "self.EntityId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

=head2 ins_to_entities

Type: has_many

Related object: L<TMS::Schema::Result::InsToEntity>

=cut

__PACKAGE__->has_many(
    "ins_to_entities",
    "TMS::Schema::Result::InsToEntity",
    {"foreign.EntityId" => "self.EntityId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

=head2 person

Type: belongs_to

Related object: L<TMS::Schema::Result::EntPerson>

=cut

__PACKAGE__->belongs_to(
    "person",
    "TMS::Schema::Result::EntPerson",
    {PrsnId => "PersonId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "CASCADE",
        on_update     => "CASCADE",
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-07 08:47:05
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yf4saVG+onaxAcQRCUYjeA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
