use utf8;
package TMS::Schema::Result::EntShipper;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::EntShipper

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<ent_shippers>

=cut

__PACKAGE__->table("ent_shippers");

=head1 ACCESSORS

=head2 ShipperId

  accessor: 'shipper_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "ShipperId",
  {
    accessor       => "shipper_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "Notes",
  { accessor => "notes", data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</ShipperId>

=back

=cut

__PACKAGE__->set_primary_key("ShipperId");

=head1 RELATIONS

=head2 dsp_loads

Type: has_many

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->has_many(
  "dsp_loads",
  "TMS::Schema::Result::DspLoad",
  { "foreign.ShipperId" => "self.ShipperId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 shipper

Type: belongs_to

Related object: L<TMS::Schema::Result::EntBusiness>

=cut

__PACKAGE__->belongs_to(
  "shipper",
  "TMS::Schema::Result::EntBusiness",
  { BizId => "ShipperId" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dpzEeTziHXj6nNfs+bsKRA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;