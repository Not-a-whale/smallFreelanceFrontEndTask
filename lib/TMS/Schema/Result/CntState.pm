use utf8;
package TMS::Schema::Result::CntState;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::CntState

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<cnt_states>

=cut

__PACKAGE__->table("cnt_states");

=head1 ACCESSORS

=head2 StateId

  accessor: 'state_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 ShortName

  accessor: 'short_name'
  data_type: 'char'
  is_nullable: 0
  size: 2

=head2 FullName

  accessor: 'full_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 Country

  accessor: 'country'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "StateId",
  {
    accessor => "state_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "ShortName",
  { accessor => "short_name", data_type => "char", is_nullable => 0, size => 2 },
  "FullName",
  {
    accessor => "full_name",
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
  "Country",
  {
    accessor => "country",
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</StateId>

=back

=cut

__PACKAGE__->set_primary_key("StateId");

=head1 UNIQUE CONSTRAINTS

=head2 C<ShortUNQ>

=over 4

=item * L</ShortName>

=item * L</Country>

=back

=cut

__PACKAGE__->add_unique_constraint("ShortUNQ", ["ShortName", "Country"]);

=head1 RELATIONS

=head2 cnt_addresses

Type: has_many

Related object: L<TMS::Schema::Result::CntAddress>

=cut

__PACKAGE__->has_many(
  "cnt_addresses",
  "TMS::Schema::Result::CntAddress",
  { "foreign.State" => "self.StateId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 drv_driverlicences

Type: has_many

Related object: L<TMS::Schema::Result::DrvDriverlicence>

=cut

__PACKAGE__->has_many(
  "drv_driverlicences",
  "TMS::Schema::Result::DrvDriverlicence",
  { "foreign.DrLcSate" => "self.StateId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ent_carriers

Type: has_many

Related object: L<TMS::Schema::Result::EntCarrier>

=cut

__PACKAGE__->has_many(
  "ent_carriers",
  "TMS::Schema::Result::EntCarrier",
  { "foreign.IFTA_State" => "self.StateId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_govidcards

Type: has_many

Related object: L<TMS::Schema::Result::HrGovidcard>

=cut

__PACKAGE__->has_many(
  "hr_govidcards",
  "TMS::Schema::Result::HrGovidcard",
  { "foreign.CardSate" => "self.StateId" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 15:51:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tmztpHJvn+mXcNF9JoLStA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;