use utf8;

package TMS::Schema::Result::DspLoadsDoc;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DspLoadsDoc

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<dsp_loads_docs>

=cut

__PACKAGE__->table("dsp_loads_docs");

=head1 ACCESSORS

=head2 DocsLoadId

  accessor: 'docs_load_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 FileId

  accessor: 'file_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 LoadId

  accessor: 'load_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DateAdded

  accessor: 'date_added'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 AddedBy

  accessor: 'added_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 FactoredDoc

  accessor: 'factored_doc'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "DocsLoadId",
    {   accessor          => "docs_load_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "FileId",
    {   accessor       => "file_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "LoadId",
    {   accessor       => "load_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "DateAdded",
    {   accessor                  => "date_added",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "AddedBy",
    {   accessor       => "added_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "FactoredDoc",
    {   accessor      => "factored_doc",
        data_type     => "tinyint",
        default_value => 0,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</DocsLoadId>

=back

=cut

__PACKAGE__->set_primary_key("DocsLoadId");

=head1 RELATIONS

=head2 added_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "added_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "AddedBy"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 file

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
    "file",
    "TMS::Schema::Result::GenFile",
    {FileId        => "FileId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 load

Type: belongs_to

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->belongs_to(
    "load",
    "TMS::Schema::Result::DspLoad",
    {LoadId        => "LoadId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 15:30:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:afV/syyV8d3D6VRUye2T2w

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
