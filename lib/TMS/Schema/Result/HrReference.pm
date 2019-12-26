use utf8;

package TMS::Schema::Result::HrReference;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::HrReference

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<hr_references>

=cut

__PACKAGE__->table("hr_references");

=head1 ACCESSORS

=head2 ReferenceId

  accessor: 'reference_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 ReferenceFor

  accessor: 'reference_for'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 ReferensorName

  accessor: 'referensor_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 ReferensorPhone

  accessor: 'referensor_phone'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 ReceivedBy

  accessor: 'received_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 ReceivedDate

  accessor: 'received_date'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 ReferenceNotes

  accessor: 'reference_notes'
  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "ReferenceId",
    {   accessor          => "reference_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "ReferenceFor",
    {   accessor       => "reference_for",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "ReferensorName",
    {   accessor    => "referensor_name",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
    "ReferensorPhone",
    {   accessor       => "referensor_phone",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "ReceivedBy",
    {   accessor       => "received_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "ReceivedDate",
    {   accessor                  => "received_date",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "ReferenceNotes",
    {accessor => "reference_notes", data_type => "text", is_nullable => 0},
);

=head1 PRIMARY KEY

=over 4

=item * L</ReferenceId>

=back

=cut

__PACKAGE__->set_primary_key("ReferenceId");

=head1 RELATIONS

=head2 received_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "received_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "ReceivedBy"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 reference_for

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "reference_for",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "ReferenceFor"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 referensor_phone

Type: belongs_to

Related object: L<TMS::Schema::Result::CntPhonesfax>

=cut

__PACKAGE__->belongs_to(
    "referensor_phone",
    "TMS::Schema::Result::CntPhonesfax",
    {PhnFaxId      => "ReferensorPhone"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-25 21:12:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SLaROue6UJcJjRJcy746tA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
