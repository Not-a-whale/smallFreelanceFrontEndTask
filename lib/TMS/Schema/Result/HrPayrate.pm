use utf8;

package TMS::Schema::Result::HrPayrate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::HrPayrate

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<hr_payrates>

=cut

__PACKAGE__->table("hr_payrates");

=head1 ACCESSORS

=head2 PayRateId

  accessor: 'pay_rate_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 AstId

  accessor: 'ast_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 RateType

  accessor: 'rate_type'
  data_type: 'enum'
  default_value: 'hourly'
  extra: {list => ["hourly","salary","weekly","biweekly","monthly","mileage","load percentage","flat rate"]}
  is_nullable: 0

=head2 RateAmount

  accessor: 'rate_amount'
  data_type: 'decimal'
  is_nullable: 0
  size: [12,2]

=head2 Agreement

  accessor: 'agreement'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 EffectiveDate

  accessor: 'effective_date'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 ExpirationDate

  accessor: 'expiration_date'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "PayRateId",
    {   accessor          => "pay_rate_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "AstId",
    {   accessor       => "ast_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "RateType",
    {   accessor      => "rate_type",
        data_type     => "enum",
        default_value => "hourly",
        extra => {list => ["hourly", "salary", "weekly", "biweekly", "monthly", "mileage", "load percentage", "flat rate",],},
        is_nullable => 0,
    },
    "RateAmount",
    {   accessor    => "rate_amount",
        data_type   => "decimal",
        is_nullable => 0,
        size        => [12, 2],
    },
    "Agreement",
    {   accessor       => "agreement",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "EffectiveDate",
    {   accessor                  => "effective_date",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "ExpirationDate",
    {   accessor                  => "expiration_date",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</PayRateId>

=back

=cut

__PACKAGE__->set_primary_key("PayRateId");

=head1 RELATIONS

=head2 agreement

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
    "agreement",
    "TMS::Schema::Result::GenFile",
    {FileId        => "Agreement"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 ast

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "ast",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "AstId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-25 21:12:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1qt972mg/goZvgqJLjDD3Q

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
