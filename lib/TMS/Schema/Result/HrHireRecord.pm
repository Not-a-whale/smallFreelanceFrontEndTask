use utf8;
package TMS::Schema::Result::HrHireRecord;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::HrHireRecord

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<hr_hire_records>

=cut

__PACKAGE__->table("hr_hire_records");

=head1 ACCESSORS

=head2 HireId

  accessor: 'hire_id'
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

=head2 Title

  accessor: 'title'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 DateHired

  accessor: 'date_hired'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 DateTerminated

  accessor: 'date_terminated'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 ReasonForTermination

  accessor: 'reason_for_termination'
  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 Photo

  accessor: 'photo'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "HireId",
  {
    accessor => "hire_id",
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
  "Title",
  { accessor => "title", data_type => "varchar", is_nullable => 1, size => 255 },
  "DateHired",
  {
    accessor => "date_hired",
    data_type => "date",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "DateTerminated",
  {
    accessor => "date_terminated",
    data_type => "date",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "ReasonForTermination",
  {
    accessor => "reason_for_termination",
    data_type => "varchar",
    is_nullable => 1,
    size => 1024,
  },
  "Photo",
  {
    accessor       => "photo",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</HireId>

=back

=cut

__PACKAGE__->set_primary_key("HireId");

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
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 15:51:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DqYKrFea/KAZ1WAnxuo5yA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;