use utf8;
package TMS::Schema::Result::FinBillingTag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinBillingTag

=head1 DESCRIPTION

Tags for billing info to distinguish the purpose of the billing info, shipping, billing, payment etc.

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_billing_tags>

=cut

__PACKAGE__->table("fin_billing_tags");

=head1 ACCESSORS

=head2 BillingTagId

  accessor: 'billing_tag_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 BillingTag

  accessor: 'billing_tag'
  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 UserDefined

  accessor: 'user_defined'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 CreatedBy

  accessor: 'created_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "BillingTagId",
  {
    accessor => "billing_tag_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "BillingTag",
  {
    accessor => "billing_tag",
    data_type => "varchar",
    is_nullable => 0,
    size => 45,
  },
  "UserDefined",
  {
    accessor      => "user_defined",
    data_type     => "tinyint",
    default_value => 1,
    extra         => { unsigned => 1 },
    is_nullable   => 0,
  },
  "CreatedBy",
  {
    accessor       => "created_by",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "DateCreated",
  {
    accessor => "date_created",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</BillingTagId>

=back

=cut

__PACKAGE__->set_primary_key("BillingTagId");

=head1 UNIQUE CONSTRAINTS

=head2 C<BillingTag_UNIQUE>

=over 4

=item * L</BillingTag>

=back

=cut

__PACKAGE__->add_unique_constraint("BillingTag_UNIQUE", ["BillingTag"]);

=head1 RELATIONS

=head2 created_by

Type: belongs_to

Related object: L<TMS::Schema::Result::EntPerson>

=cut

__PACKAGE__->belongs_to(
  "created_by",
  "TMS::Schema::Result::EntPerson",
  { PrsnId => "CreatedBy" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 fin_billing_infos

Type: has_many

Related object: L<TMS::Schema::Result::FinBillingInfo>

=cut

__PACKAGE__->has_many(
  "fin_billing_infos",
  "TMS::Schema::Result::FinBillingInfo",
  { "foreign.BillingTagId" => "self.BillingTagId" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 15:51:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tpbBUeVyYT04oFF+Uubvxw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;