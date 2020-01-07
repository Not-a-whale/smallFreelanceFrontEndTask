use utf8;

package TMS::Schema::Result::CrrIfta;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::CrrIfta

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<crr_iftas>

=cut

__PACKAGE__->table("crr_iftas");

=head1 ACCESSORS

=head2 IftaAcctId

  accessor: 'ifta_acct_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 State

  accessor: 'state'
  data_type: 'char'
  is_nullable: 0
  size: 2

=head2 IFTALicense

  accessor: 'iftalicense'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 McAccount

  accessor: 'mc_account'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 ProofDoc

  accessor: 'proof_doc'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 Effective

  accessor: 'effective'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 Expiration

  accessor: 'expiration'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 BizId

  accessor: 'biz_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

Who pays for it

=cut

__PACKAGE__->add_columns(
    "IftaAcctId",
    {   accessor          => "ifta_acct_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "State",
    {accessor => "state", data_type => "char", is_nullable => 0, size => 2},
    "IFTALicense",
    {   accessor    => "iftalicense",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
    "McAccount",
    {   accessor    => "mc_account",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
    "ProofDoc",
    {   accessor       => "proof_doc",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "Effective",
    {   accessor                  => "effective",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "Expiration",
    {   accessor                  => "expiration",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "BizId",
    {   accessor       => "biz_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</IftaAcctId>

=back

=cut

__PACKAGE__->set_primary_key("IftaAcctId");

=head1 UNIQUE CONSTRAINTS

=head2 C<IFTALicense_UNIQUE>

=over 4

=item * L</IFTALicense>

=back

=cut

__PACKAGE__->add_unique_constraint("IFTALicense_UNIQUE", ["IFTALicense"]);

=head2 C<mcaccount_UNIQUE>

=over 4

=item * L</McAccount>

=back

=cut

__PACKAGE__->add_unique_constraint("mcaccount_UNIQUE", ["McAccount"]);

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

=head2 crr_ifta_decals

Type: has_many

Related object: L<TMS::Schema::Result::CrrIftaDecal>

=cut

__PACKAGE__->has_many(
    "crr_ifta_decals",
    "TMS::Schema::Result::CrrIftaDecal",
    {"foreign.IftaAcctId" => "self.IftaAcctId"},
    {cascade_copy         => 0, cascade_delete => 0},
);

=head2 proof_doc

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
    "proof_doc",
    "TMS::Schema::Result::GenFile",
    {FileId => "ProofDoc"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-07 08:47:05
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GgiYs3XNM5yN5LoSmjhOgQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
