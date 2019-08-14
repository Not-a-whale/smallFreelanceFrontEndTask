use utf8;
package TMS::Schema::Result::DspLoadsDestinationsDoc;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DspLoadsDestinationsDoc

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<dsp_loads_destinations_docs>

=cut

__PACKAGE__->table("dsp_loads_destinations_docs");

=head1 ACCESSORS

=head2 LoadDestinationId

  accessor: 'load_destination_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 FileId

  accessor: 'file_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Verified

  accessor: 'verified'
  data_type: 'enum'
  extra: {list => ["unknown","yes","no"]}
  is_nullable: 0

=head2 ApprovedBy

  accessor: 'approved_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "LoadDestinationId",
  {
    accessor       => "load_destination_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "FileId",
  {
    accessor       => "file_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "Verified",
  {
    accessor    => "verified",
    data_type   => "enum",
    extra       => { list => ["unknown", "yes", "no"] },
    is_nullable => 0,
  },
  "ApprovedBy",
  {
    accessor       => "approved_by",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</LoadDestinationId>

=item * L</FileId>

=back

=cut

__PACKAGE__->set_primary_key("LoadDestinationId", "FileId");

=head1 RELATIONS

=head2 approved_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
  "approved_by",
  "TMS::Schema::Result::HrAssociate",
  { AstId => "ApprovedBy" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 file

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
  "file",
  "TMS::Schema::Result::GenFile",
  { FileId => "FileId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 load_destination

Type: belongs_to

Related object: L<TMS::Schema::Result::DspLoadsDestination>

=cut

__PACKAGE__->belongs_to(
  "load_destination",
  "TMS::Schema::Result::DspLoadsDestination",
  { DestinationId => "LoadDestinationId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-13 13:28:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uN6BFh2QlmebiLZ4e21eOw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;