use utf8;

package TMS::Schema::Result::FinCheque;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinCheque

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_cheques>

=cut

__PACKAGE__->table("fin_cheques");

=head1 ACCESSORS

=head2 ChequeId

  accessor: 'cheque_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 ChequeNumber

  accessor: 'cheque_number'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 TransactionId

  accessor: 'transaction_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 CreatedBy

  accessor: 'created_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 AuthorizedBy

  accessor: 'authorized_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 VoidedBy

  accessor: 'voided_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 Payer

  accessor: 'payer'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Payee

  accessor: 'payee'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Bank

  accessor: 'bank'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Amount

  accessor: 'amount'
  data_type: 'decimal'
  extra: {unsigned => 1}
  is_nullable: 0
  size: [12,2]

=head2 Memo

  accessor: 'memo'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 PayerName

  accessor: 'payer_name'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 PayerStreetAddress

  accessor: 'payer_street_address'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 PayerCityAddress

  accessor: 'payer_city_address'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 PayerPhone

  accessor: 'payer_phone'
  data_type: 'varchar'
  is_nullable: 1
  size: 15

=head2 PayeeName

  accessor: 'payee_name'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 PayeeStreetAddress

  accessor: 'payee_street_address'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 PayeeCityAddress

  accessor: 'payee_city_address'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 PayeePhone

  accessor: 'payee_phone'
  data_type: 'varchar'
  is_nullable: 1
  size: 15

=head2 BankName

  accessor: 'bank_name'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 BankStreetAddress

  accessor: 'bank_street_address'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 BankCityAddress

  accessor: 'bank_city_address'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 BankPhone

  accessor: 'bank_phone'
  data_type: 'varchar'
  is_nullable: 1
  size: 15

=head2 BankRoutingNumber

  accessor: 'bank_routing_number'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 BankAccountNumber

  accessor: 'bank_account_number'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 DateVoided

  accessor: 'date_voided'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 DateAuthorized

  accessor: 'date_authorized'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "ChequeId",
    {   accessor    => "cheque_id",
        data_type   => "bigint",
        extra       => {unsigned => 1},
        is_nullable => 0,
    },
    "ChequeNumber",
    {   accessor    => "cheque_number",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 0,
    },
    "TransactionId",
    {   accessor       => "transaction_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "CreatedBy",
    {   accessor       => "created_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "AuthorizedBy",
    {   accessor       => "authorized_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "VoidedBy",
    {   accessor       => "voided_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "Payer",
    {   accessor       => "payer",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "Payee",
    {   accessor       => "payee",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "Bank",
    {   accessor       => "bank",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "Amount",
    {   accessor    => "amount",
        data_type   => "decimal",
        extra       => {unsigned => 1},
        is_nullable => 0,
        size        => [12, 2],
    },
    "Memo",
    {accessor => "memo", data_type => "varchar", is_nullable => 1, size => 255},
    "PayerName",
    {   accessor    => "payer_name",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
    "PayerStreetAddress",
    {   accessor    => "payer_street_address",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
    "PayerCityAddress",
    {   accessor    => "payer_city_address",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
    "PayerPhone",
    {   accessor    => "payer_phone",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 15,
    },
    "PayeeName",
    {   accessor    => "payee_name",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
    "PayeeStreetAddress",
    {   accessor    => "payee_street_address",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
    "PayeeCityAddress",
    {   accessor    => "payee_city_address",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
    "PayeePhone",
    {   accessor    => "payee_phone",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 15,
    },
    "BankName",
    {   accessor    => "bank_name",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
    "BankStreetAddress",
    {   accessor    => "bank_street_address",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
    "BankCityAddress",
    {   accessor    => "bank_city_address",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
    "BankPhone",
    {   accessor    => "bank_phone",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 15,
    },
    "BankRoutingNumber",
    {   accessor    => "bank_routing_number",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
    "BankAccountNumber",
    {   accessor    => "bank_account_number",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
    "DateCreated",
    {   accessor                  => "date_created",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "DateVoided",
    {   accessor                  => "date_voided",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "DateAuthorized",
    {   accessor                  => "date_authorized",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</ChequeId>

=back

=cut

__PACKAGE__->set_primary_key("ChequeId");

=head1 UNIQUE CONSTRAINTS

=head2 C<ChequeNumber_UNIQUE>

=over 4

=item * L</ChequeNumber>

=back

=cut

__PACKAGE__->add_unique_constraint("ChequeNumber_UNIQUE", ["ChequeNumber"]);

=head1 RELATIONS

=head2 authorized_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "authorized_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId => "AuthorizedBy"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 bank

Type: belongs_to

Related object: L<TMS::Schema::Result::BizBranch>

=cut

__PACKAGE__->belongs_to(
    "bank",
    "TMS::Schema::Result::BizBranch",
    {BrnchId       => "Bank"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 created_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "created_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "CreatedBy"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 fin_cheques_prints

Type: has_many

Related object: L<TMS::Schema::Result::FinChequesPrint>

=cut

__PACKAGE__->has_many(
    "fin_cheques_prints", "TMS::Schema::Result::FinChequesPrint",
    {"foreign.ChequeId" => "self.ChequeId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 payee

Type: belongs_to

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->belongs_to(
    "payee", "TMS::Schema::Result::Entity",
    {EntityId      => "Payee"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT"},
);

=head2 payer

Type: belongs_to

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->belongs_to(
    "payer", "TMS::Schema::Result::Entity",
    {EntityId      => "Payer"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT"},
);

=head2 transaction

Type: belongs_to

Related object: L<TMS::Schema::Result::FinTransaction>

=cut

__PACKAGE__->belongs_to(
    "transaction",
    "TMS::Schema::Result::FinTransaction",
    {TransactionId => "TransactionId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 voided_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "voided_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId => "VoidedBy"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-26 15:33:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:f/2ZgqQ93ogTc6qtL8gCHg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
