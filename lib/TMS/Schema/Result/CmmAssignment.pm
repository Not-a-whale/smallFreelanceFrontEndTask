use utf8;
package TMS::Schema::Result::CmmAssignment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::CmmAssignment

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<cmm_assignments>

=cut

__PACKAGE__->table("cmm_assignments");

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
  size: 45

=head2 DateAdded

  accessor: 'date_added'
  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
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
  {
    accessor       => "associate_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "CommissionPackage",
  {
    accessor => "commission_package",
    data_type => "varchar",
    is_foreign_key => 1,
    is_nullable => 0,
    size => 45,
  },
  "DateAdded",
  {
    accessor => "date_added",
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "AddedBy",
  {
    accessor       => "added_by",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);

=head1 RELATIONS

=head2 added_by

Type: belongs_to

Related object: L<TMS::Schema::Result::EntPerson>

=cut

__PACKAGE__->belongs_to(
  "added_by",
  "TMS::Schema::Result::EntPerson",
  { PrsnId => "AddedBy" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 associate

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
  "associate",
  "TMS::Schema::Result::HrAssociate",
  { AstId => "AssociateId" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 commission_package

Type: belongs_to

Related object: L<TMS::Schema::Result::CmmPackage>

=cut

__PACKAGE__->belongs_to(
  "commission_package",
  "TMS::Schema::Result::CmmPackage",
  { Name => "CommissionPackage" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 15:51:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:53aBdHAgF1ydOV1/2JaU7A


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;