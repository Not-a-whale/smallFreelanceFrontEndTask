use utf8;
package TMS::Schema::Result::CmmPackage;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::CmmPackage

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<cmm_packages>

=cut

__PACKAGE__->table("cmm_packages");

=head1 ACCESSORS

=head2 Name

  accessor: 'name'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "Name",
  { accessor => "name", data_type => "varchar", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</Name>

=back

=cut

__PACKAGE__->set_primary_key("Name");

=head1 RELATIONS

=head2 cmm_assignments

Type: has_many

Related object: L<TMS::Schema::Result::CmmAssignment>

=cut

__PACKAGE__->has_many(
  "cmm_assignments",
  "TMS::Schema::Result::CmmAssignment",
  { "foreign.CommissionPackage" => "self.Name" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cmm_assignments_customers

Type: has_many

Related object: L<TMS::Schema::Result::CmmAssignmentsCustomer>

=cut

__PACKAGE__->has_many(
  "cmm_assignments_customers",
  "TMS::Schema::Result::CmmAssignmentsCustomer",
  { "foreign.CommissionPackage" => "self.Name" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cmm_assignments_groups

Type: has_many

Related object: L<TMS::Schema::Result::CmmAssignmentsGroup>

=cut

__PACKAGE__->has_many(
  "cmm_assignments_groups",
  "TMS::Schema::Result::CmmAssignmentsGroup",
  { "foreign.CommissionPackage" => "self.Name" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cmm_package_tiers

Type: has_many

Related object: L<TMS::Schema::Result::CmmPackageTier>

=cut

__PACKAGE__->has_many(
  "cmm_package_tiers",
  "TMS::Schema::Result::CmmPackageTier",
  { "foreign.Package" => "self.Name" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-13 13:28:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:49hKzusMkHwP0vJKmR7Diw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;