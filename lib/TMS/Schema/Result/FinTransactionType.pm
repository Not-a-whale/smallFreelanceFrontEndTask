use utf8;

package TMS::Schema::Result::FinTransactionType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinTransactionType

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_transaction_types>

=cut

__PACKAGE__->table("fin_transaction_types");

=head1 ACCESSORS

=head2 TransTypeId

  accessor: 'trans_type_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 TransTypeName

  accessor: 'trans_type_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

=cut

__PACKAGE__->add_columns(
    "TransTypeId",
    {   accessor          => "trans_type_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "TransTypeName",
    {   accessor    => "trans_type_name",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 64,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</TransTypeId>

=back

=cut

__PACKAGE__->set_primary_key("TransTypeId");

=head1 UNIQUE CONSTRAINTS

=head2 C<TransTypeName_UNIQUE>

=over 4

=item * L</TransTypeName>

=back

=cut

__PACKAGE__->add_unique_constraint("TransTypeName_UNIQUE", ["TransTypeName"]);

=head1 RELATIONS

=head2 fin_item_templates

Type: has_many

Related object: L<TMS::Schema::Result::FinItemTemplate>

=cut

__PACKAGE__->has_many(
    "fin_item_templates",
    "TMS::Schema::Result::FinItemTemplate",
    {"foreign.TransactionType" => "self.TransTypeId"},
    {cascade_copy              => 0, cascade_delete => 0},
);

=head2 fin_transactions

Type: has_many

Related object: L<TMS::Schema::Result::FinTransaction>

=cut

__PACKAGE__->has_many(
    "fin_transactions",
    "TMS::Schema::Result::FinTransaction",
    {"foreign.TransactionType" => "self.TransTypeId"},
    {cascade_copy              => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-04-28 11:12:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Y7HjnN4ER9uQNF7mhlhJSw

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
