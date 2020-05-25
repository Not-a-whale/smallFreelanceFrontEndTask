use utf8;

package TMS::Schema::Result::HrConfidential;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::HrConfidential

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<hr_confidentials>

=cut

__PACKAGE__->table("hr_confidentials");

=head1 ACCESSORS

=head2 AstId

  accessor: 'ast_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Birthday

  accessor: 'birthday'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 MaritalStatus

  accessor: 'marital_status'
  data_type: 'enum'
  extra: {list => ["single","married","widowed","divorsed"]}
  is_nullable: 0

=head2 Gender

  accessor: 'gender'
  data_type: 'enum'
  extra: {list => ["male","female"]}
  is_nullable: 0

=head2 PersonalPhone

  accessor: 'personal_phone'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

mobile phone

=head2 PersonalEmail

  accessor: 'personal_email'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
    "AstId",
    {   accessor       => "ast_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "Birthday",
    {   accessor                  => "birthday",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "MaritalStatus",
    {   accessor    => "marital_status",
        data_type   => "enum",
        extra       => {list => ["single", "married", "widowed", "divorsed"]},
        is_nullable => 0,
    },
    "Gender",
    {   accessor    => "gender",
        data_type   => "enum",
        extra       => {list => ["male", "female"]},
        is_nullable => 0,
    },
    "PersonalPhone",
    {   accessor       => "personal_phone",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "PersonalEmail",
    {   accessor    => "personal_email",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</AstId>

=back

=cut

__PACKAGE__->set_primary_key("AstId");

=head1 RELATIONS

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

=head2 personal_phone

Type: belongs_to

Related object: L<TMS::Schema::Result::CntPhonesfax>

=cut

__PACKAGE__->belongs_to(
    "personal_phone",
    "TMS::Schema::Result::CntPhonesfax",
    {PhnFaxId      => "PersonalPhone"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-05-25 15:45:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dJvugSVHILSesHzGOMkRlQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
