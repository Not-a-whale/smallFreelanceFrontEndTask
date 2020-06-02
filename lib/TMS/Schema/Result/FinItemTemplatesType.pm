use utf8;

package TMS::Schema::Result::FinItemTemplatesType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinItemTemplatesType

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_item_templates_types>

=cut

__PACKAGE__->table("fin_item_templates_types");

=head1 ACCESSORS

=head2 TemplateTypeId

  accessor: 'template_type_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 Name

  accessor: 'name'
  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 UserDefined

  accessor: 'user_defined'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 DisplayToUser

  accessor: 'display_to_user'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 Description

  accessor: 'description'
  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "TemplateTypeId",
    {   accessor          => "template_type_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "Name",
    {accessor => "name", data_type => "varchar", is_nullable => 0, size => 1024},
    "UserDefined",
    {   accessor      => "user_defined",
        data_type     => "tinyint",
        default_value => 1,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
    "DisplayToUser",
    {   accessor      => "display_to_user",
        data_type     => "tinyint",
        default_value => 1,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
    "Description",
    {accessor => "description", data_type => "text", is_nullable => 0},
);

=head1 PRIMARY KEY

=over 4

=item * L</TemplateTypeId>

=back

=cut

__PACKAGE__->set_primary_key("TemplateTypeId");

=head1 RELATIONS

=head2 fin_item_templates

Type: has_many

Related object: L<TMS::Schema::Result::FinItemTemplate>

=cut

__PACKAGE__->has_many(
    "fin_item_templates",
    "TMS::Schema::Result::FinItemTemplate",
    {"foreign.TemplateTypeId" => "self.TemplateTypeId"},
    {cascade_copy             => 0, cascade_delete => 0},
);

=head2 msg_fin_item_templates_types

Type: has_many

Related object: L<TMS::Schema::Result::MsgFinItemTemplatesType>

=cut

__PACKAGE__->has_many(
    "msg_fin_item_templates_types", "TMS::Schema::Result::MsgFinItemTemplatesType",
    {"foreign.TemplateTypeId" => "self.TemplateTypeId"}, {cascade_copy => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 13:19:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:su0FpbsI3VCocsYk3BuFmg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
