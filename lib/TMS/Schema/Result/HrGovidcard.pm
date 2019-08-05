use utf8;
package TMS::Schema::Result::HrGovidcard;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::HrGovidcard

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<hr_govidcards>

=cut

__PACKAGE__->table("hr_govidcards");

=head1 ACCESSORS

=head2 CardId

  accessor: 'card_id'
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

=head2 CardNumber

  accessor: 'card_number'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 CardDateExpired

  accessor: 'card_date_expired'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 CardDateValid

  accessor: 'card_date_valid'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 CardSate

  accessor: 'card_sate'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 CardType

  accessor: 'card_type'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "CardId",
  {
    accessor => "card_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "AstId",
  {
    accessor       => "ast_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "CardNumber",
  {
    accessor => "card_number",
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
  "CardDateExpired",
  {
    accessor => "card_date_expired",
    data_type => "date",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "CardDateValid",
  {
    accessor => "card_date_valid",
    data_type => "date",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "CardSate",
  {
    accessor       => "card_sate",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "CardType",
  {
    accessor => "card_type",
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</CardId>

=back

=cut

__PACKAGE__->set_primary_key("CardId");

=head1 RELATIONS

=head2 ast

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
  "ast",
  "TMS::Schema::Result::HrAssociate",
  { AstId => "AstId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 card_sate

Type: belongs_to

Related object: L<TMS::Schema::Result::CntState>

=cut

__PACKAGE__->belongs_to(
  "card_sate",
  "TMS::Schema::Result::CntState",
  { StateId => "CardSate" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JoofS21KBwLISaknhXeqNg


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;