use utf8;
package TMS::Schema::Result::CrrPermitAccountDoc;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::CrrPermitAccountDoc - State Registration Documents	

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<crr_permit_account_docs>

=cut

__PACKAGE__->table("crr_permit_account_docs");

=head1 ACCESSORS

=head2 PrmtRegDocId

  accessor: 'prmt_reg_doc_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 CrrPrmtAccId

  accessor: 'crr_prmt_acc_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 CrrPrmtAccDoc

  accessor: 'crr_prmt_acc_doc'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "PrmtRegDocId",
  {
    accessor => "prmt_reg_doc_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "CrrPrmtAccId",
  {
    accessor       => "crr_prmt_acc_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "CrrPrmtAccDoc",
  {
    accessor       => "crr_prmt_acc_doc",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</PrmtRegDocId>

=back

=cut

__PACKAGE__->set_primary_key("PrmtRegDocId");

=head1 UNIQUE CONSTRAINTS

=head2 C<UniqPermitRegDoc>

=over 4

=item * L</CrrPrmtAccId>

=item * L</CrrPrmtAccDoc>

=back

=cut

__PACKAGE__->add_unique_constraint("UniqPermitRegDoc", ["CrrPrmtAccId", "CrrPrmtAccDoc"]);

=head1 RELATIONS

=head2 crr_prmt_acc

Type: belongs_to

Related object: L<TMS::Schema::Result::CrrPermitAccount>

=cut

__PACKAGE__->belongs_to(
  "crr_prmt_acc",
  "TMS::Schema::Result::CrrPermitAccount",
  { CrrPrmtAccId => "CrrPrmtAccId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 crr_prmt_acc_doc

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
  "crr_prmt_acc_doc",
  "TMS::Schema::Result::GenFile",
  { FileId => "CrrPrmtAccDoc" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-10 15:38:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:52bgBT8wIUFtC8FZ4miKlQ
# These lines were loaded from '/home/cpeter/temp/lib/TMS/Schema/Result/CrrPermitAccountDoc.pm' found in @INC.
# They are now part of the custom portion of this file
# for you to hand-edit.  If you do not either delete
# this section or remove that file from @INC, this section
# will be repeated redundantly when you re-create this
# file again via Loader!  See skip_load_external to disable
# this feature.

use utf8;
package TMS::Schema::Result::CrrPermitAccountDoc;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::CrrPermitAccountDoc - State Registration Documents	

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<crr_permit_account_docs>

=cut

__PACKAGE__->table("crr_permit_account_docs");

=head1 ACCESSORS

=head2 PrmtRegDocId

  accessor: 'prmt_reg_doc_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 CrrPrmtAccId

  accessor: 'crr_prmt_acc_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 CrrPrmtAccDoc

  accessor: 'crr_prmt_acc_doc'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "PrmtRegDocId",
  {
    accessor => "prmt_reg_doc_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "CrrPrmtAccId",
  {
    accessor       => "crr_prmt_acc_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "CrrPrmtAccDoc",
  {
    accessor       => "crr_prmt_acc_doc",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</PrmtRegDocId>

=back

=cut

__PACKAGE__->set_primary_key("PrmtRegDocId");

=head1 UNIQUE CONSTRAINTS

=head2 C<UniqPermitRegDoc>

=over 4

=item * L</CrrPrmtAccId>

=item * L</CrrPrmtAccDoc>

=back

=cut

__PACKAGE__->add_unique_constraint("UniqPermitRegDoc", ["CrrPrmtAccId", "CrrPrmtAccDoc"]);

=head1 RELATIONS

=head2 crr_prmt_acc

Type: belongs_to

Related object: L<TMS::Schema::Result::CrrPermitAccount>

=cut

__PACKAGE__->belongs_to(
  "crr_prmt_acc",
  "TMS::Schema::Result::CrrPermitAccount",
  { CrrPrmtAccId => "CrrPrmtAccId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 crr_prmt_acc_doc

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
  "crr_prmt_acc_doc",
  "TMS::Schema::Result::GenFile",
  { FileId => "CrrPrmtAccDoc" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-10 12:29:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7qYWi8jydFua9CL51zr0sw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;