use utf8;

package TMS::Schema::Result::CrrPermitAccount;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::CrrPermitAccount

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<crr_permit_accounts>

=cut

__PACKAGE__->table("crr_permit_accounts");

=head1 ACCESSORS

=head2 CrrPrmtAccId

  accessor: 'crr_prmt_acc_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 AccountNo

  accessor: 'account_no'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 State

  accessor: 'state'
  data_type: 'char'
  is_nullable: 0
  size: 2

=head2 CarrierId

  accessor: 'carrier_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "CrrPrmtAccId",
    {   accessor          => "crr_prmt_acc_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "AccountNo",
    {   accessor    => "account_no",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
    "State",
    {accessor => "state", data_type => "char", is_nullable => 0, size => 2},
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

=item * L</CrrPrmtAccId>

=back

=cut

__PACKAGE__->set_primary_key("CrrPrmtAccId");

=head1 RELATIONS

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

=head2 crr_permit_account_docs

Type: has_many

Related object: L<TMS::Schema::Result::CrrPermitAccountDoc>

=cut

__PACKAGE__->has_many(
    "crr_permit_account_docs", "TMS::Schema::Result::CrrPermitAccountDoc",
    {"foreign.CrrPrmtAccId" => "self.CrrPrmtAccId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 crr_state_permits

Type: has_many

Related object: L<TMS::Schema::Result::CrrStatePermit>

=cut

__PACKAGE__->has_many(
    "crr_state_permits",
    "TMS::Schema::Result::CrrStatePermit",
    {"foreign.CrrPrmtAccId" => "self.CrrPrmtAccId"},
    {cascade_copy           => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 09:43:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tDaGZGXPvnCK8xhOh4IexA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
