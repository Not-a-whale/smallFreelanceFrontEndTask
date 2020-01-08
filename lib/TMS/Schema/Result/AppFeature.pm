use utf8;

package TMS::Schema::Result::AppFeature;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::AppFeature

=head1 DESCRIPTION

Maps features to routes which then can be mapped to permissions

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<app_features>

=cut

__PACKAGE__->table("app_features");

=head1 ACCESSORS

=head2 AppFeatureId

  accessor: 'app_feature_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 Name

  accessor: 'name'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

Dev Notes

=cut

__PACKAGE__->add_columns(
    "AppFeatureId",
    {   accessor          => "app_feature_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "Name",
    {accessor => "name", data_type => "varchar", is_nullable => 0, size => 64},
    "Notes",
    {accessor => "notes", data_type => "text", is_nullable => 1},
);

=head1 PRIMARY KEY

=over 4

=item * L</AppFeatureId>

=back

=cut

__PACKAGE__->set_primary_key("AppFeatureId");

=head1 UNIQUE CONSTRAINTS

=head2 C<Name_UNIQUE>

=over 4

=item * L</Name>

=back

=cut

__PACKAGE__->add_unique_constraint("Name_UNIQUE", ["Name"]);

=head1 RELATIONS

=head2 app_permissions

Type: has_many

Related object: L<TMS::Schema::Result::AppPermission>

=cut

__PACKAGE__->has_many(
    "app_permissions",
    "TMS::Schema::Result::AppPermission",
    {"foreign.Feature" => "self.AppFeatureId"},
    {cascade_copy      => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 09:43:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5E21m7+ouaR13Skv56jwag

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
