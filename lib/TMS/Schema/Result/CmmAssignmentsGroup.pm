use utf8;

package TMS::Schema::Result::CmmAssignmentsGroup;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::CmmAssignmentsGroup

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<cmm_assignments_groups>

=cut

__PACKAGE__->table("cmm_assignments_groups");

=head1 ACCESSORS

=head2 AssociateId

  accessor: 'associate_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 CommissionPackage

  accessor: 'commission_package'
  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 255

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

=cut

__PACKAGE__->add_columns(
    "AssociateId",
    {   accessor       => "associate_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "CommissionPackage",
    {   accessor       => "commission_package",
        data_type      => "varchar",
        is_foreign_key => 1,
        is_nullable    => 0,
        size           => 255,
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
);

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

=head2 associate

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "associate",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "AssociateId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 commission_package

Type: belongs_to

Related object: L<TMS::Schema::Result::CmmPackage>

=cut

__PACKAGE__->belongs_to(
    "commission_package",
    "TMS::Schema::Result::CmmPackage",
    {Name          => "CommissionPackage"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-25 21:12:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FH5XaI3ICvNmCr9lTWqxMg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
