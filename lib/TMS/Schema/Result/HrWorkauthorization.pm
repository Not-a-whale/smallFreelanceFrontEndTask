use utf8;
package TMS::Schema::Result::HrWorkauthorization;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::HrWorkauthorization

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<hr_workauthorizations>

=cut

__PACKAGE__->table("hr_workauthorizations");

=head1 ACCESSORS

=head2 WrkAuthId

  accessor: 'wrk_auth_id'
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

=head2 Photo

  accessor: 'photo'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DocumentName

  accessor: 'document_name'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 DocumentNumber

  accessor: 'document_number'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 ExpirationDate

  accessor: 'expiration_date'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "WrkAuthId",
  {
    accessor => "wrk_auth_id",
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
  "Photo",
  {
    accessor       => "photo",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "DocumentName",
  {
    accessor => "document_name",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "DocumentNumber",
  {
    accessor => "document_number",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "ExpirationDate",
  {
    accessor => "expiration_date",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</WrkAuthId>

=back

=cut

__PACKAGE__->set_primary_key("WrkAuthId");

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

=head2 photo

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
  "photo",
  "TMS::Schema::Result::GenFile",
  { FileId => "Photo" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:P75jms3vYIl3amT8ohMNPw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;