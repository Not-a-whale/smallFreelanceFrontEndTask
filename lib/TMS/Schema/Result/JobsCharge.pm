use utf8;
package TMS::Schema::Result::JobsCharge;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::JobsCharge

=head1 DESCRIPTION

This table is probably not going to be used because invoice items are now referencing the jobs table.

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<jobs_charges>

=cut

__PACKAGE__->table("jobs_charges");

=head1 ACCESSORS

=head2 ChargeId

  accessor: 'charge_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 JobId

  accessor: 'job_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 DateAdded

  accessor: 'date_added'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 AddedBy

  accessor: 'added_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 ChargeItemId

  accessor: 'charge_item_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

TODO: integrate with accounting system

=head2 ChargedEntityId

  accessor: 'charged_entity_id'
  data_type: 'set'
  default_value: 'one,two,three'
  extra: {list => ["one","two","three"]}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "ChargeId",
  {
    accessor => "charge_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "JobId",
  {
    accessor    => "job_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 0,
  },
  "DateAdded",
  {
    accessor => "date_added",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
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
  "ChargeItemId",
  {
    accessor    => "charge_item_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 0,
  },
  "ChargedEntityId",
  {
    accessor      => "charged_entity_id",
    data_type     => "set",
    default_value => "one,two,three",
    extra         => { list => ["one", "two", "three"] },
    is_nullable   => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</ChargeId>

=back

=cut

__PACKAGE__->set_primary_key("ChargeId");

=head1 RELATIONS

=head2 added_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
  "added_by",
  "TMS::Schema::Result::HrAssociate",
  { AstId => "AddedBy" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BDgoAUHTPVlsGVEGiZUnMw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;