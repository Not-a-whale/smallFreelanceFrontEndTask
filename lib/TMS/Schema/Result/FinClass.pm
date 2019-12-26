use utf8;

package TMS::Schema::Result::FinClass;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinClass

=head1 DESCRIPTION

Classes for classifying transactions, just like in some popular financial applications that shall not be mentioned.

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_classes>

=cut

__PACKAGE__->table("fin_classes");

=head1 ACCESSORS

=head2 ClassId

  accessor: 'class_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 Name

  accessor: 'name'
  data_type: 'varchar'
  is_nullable: 0
  size: 45

=cut

__PACKAGE__->add_columns(
    "ClassId",
    {   accessor          => "class_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "Name",
    {accessor => "name", data_type => "varchar", is_nullable => 0, size => 45},
);

=head1 PRIMARY KEY

=over 4

=item * L</ClassId>

=back

=cut

__PACKAGE__->set_primary_key("ClassId");

=head1 UNIQUE CONSTRAINTS

=head2 C<Name_UNIQUE>

=over 4

=item * L</Name>

=back

=cut

__PACKAGE__->add_unique_constraint("Name_UNIQUE", ["Name"]);

=head1 RELATIONS

=head2 fin_transactions

Type: has_many

Related object: L<TMS::Schema::Result::FinTransaction>

=cut

__PACKAGE__->has_many(
    "fin_transactions", "TMS::Schema::Result::FinTransaction",
    {"foreign.Class" => "self.ClassId"}, {cascade_copy => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-26 15:33:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Rg7xv7OqlHNuLjr6gJFCZg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
