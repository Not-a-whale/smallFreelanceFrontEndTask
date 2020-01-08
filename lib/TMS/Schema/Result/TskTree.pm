use utf8;

package TMS::Schema::Result::TskTree;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::TskTree - Project Tree Closures

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<tsk_trees>

=cut

__PACKAGE__->table("tsk_trees");

=head1 ACCESSORS

=head2 ans_des_id

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 ancestor

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 descendant

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 length

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "ans_des_id",
    {   data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "ancestor",
    {   data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "descendant",
    {   data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "length",
    {data_type => "integer", default_value => 0, is_nullable => 0},
);

=head1 PRIMARY KEY

=over 4

=item * L</ans_des_id>

=back

=cut

__PACKAGE__->set_primary_key("ans_des_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<TskAnsDesUnq>

=over 4

=item * L</ancestor>

=item * L</descendant>

=back

=cut

__PACKAGE__->add_unique_constraint("TskAnsDesUnq", ["ancestor", "descendant"]);

=head1 RELATIONS

=head2 ancestor

Type: belongs_to

Related object: L<TMS::Schema::Result::TskTask>

=cut

__PACKAGE__->belongs_to(
    "ancestor",
    "TMS::Schema::Result::TskTask",
    {tskid         => "ancestor"},
    {is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE"},
);

=head2 descendant

Type: belongs_to

Related object: L<TMS::Schema::Result::TskTask>

=cut

__PACKAGE__->belongs_to(
    "descendant",
    "TMS::Schema::Result::TskTask",
    {tskid         => "descendant"},
    {is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 10:28:19
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Q9Kx0UsbJ6HUvIWsV8mChg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
