use utf8;

package TMS::Schema::Result::MsgFinItemTemplatesType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::MsgFinItemTemplatesType

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<msg_fin_item_templates_types>

=cut

__PACKAGE__->table("msg_fin_item_templates_types");

=head1 ACCESSORS

=head2 idmsg_fin_item_templates_types

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 mnoteid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 TemplateTypeId

  accessor: 'template_type_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "idmsg_fin_item_templates_types",
    {   data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "mnoteid",
    {   data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "TemplateTypeId",
    {   accessor       => "template_type_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</idmsg_fin_item_templates_types>

=back

=cut

__PACKAGE__->set_primary_key("idmsg_fin_item_templates_types");

=head1 UNIQUE CONSTRAINTS

=head2 C<msg_fin_item_templates_types_unq>

=over 4

=item * L</mnoteid>

=item * L</TemplateTypeId>

=back

=cut

__PACKAGE__->add_unique_constraint("msg_fin_item_templates_types_unq", ["mnoteid", "TemplateTypeId"],);

=head1 RELATIONS

=head2 mnoteid

Type: belongs_to

Related object: L<TMS::Schema::Result::MsgNote>

=cut

__PACKAGE__->belongs_to(
    "mnoteid",
    "TMS::Schema::Result::MsgNote",
    {mnoteid       => "mnoteid"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 template_type

Type: belongs_to

Related object: L<TMS::Schema::Result::FinItemTemplatesType>

=cut

__PACKAGE__->belongs_to(
    "template_type",
    "TMS::Schema::Result::FinItemTemplatesType",
    {TemplateTypeId => "TemplateTypeId"},
    {is_deferrable  => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 20:08:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:f5+g8LtjuiabJHggQv8a9g

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
