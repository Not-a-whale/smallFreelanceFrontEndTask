use utf8;

package TMS::Schema::Result::EntOwnerOperator;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::EntOwnerOperator

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<ent_owner_operators>

=cut

__PACKAGE__->table("ent_owner_operators");

=head1 ACCESSORS

=head2 BizId

  accessor: 'biz_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 CarrierId

  accessor: 'carrier_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "BizId",
    {   accessor       => "biz_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "CarrierId",
    {   accessor       => "carrier_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</BizId>

=back

=cut

__PACKAGE__->set_primary_key("BizId");

=head1 RELATIONS

=head2 biz

Type: belongs_to

Related object: L<TMS::Schema::Result::EntBusiness>

=cut

__PACKAGE__->belongs_to(
    "biz",
    "TMS::Schema::Result::EntBusiness",
    {BizId         => "BizId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 carrier

Type: belongs_to

Related object: L<TMS::Schema::Result::EntCarrier>

=cut

__PACKAGE__->belongs_to(
    "carrier",
    "TMS::Schema::Result::EntCarrier",
    {CarrierId     => "CarrierId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-03-10 16:28:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3JolR1YltrYjCjIV5g8eWA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
