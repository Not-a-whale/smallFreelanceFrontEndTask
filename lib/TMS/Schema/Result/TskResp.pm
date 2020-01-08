use utf8;

package TMS::Schema::Result::TskResp;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::TskResp - Task, User, Action - connections

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<tsk_resps>

=cut

__PACKAGE__->table("tsk_resps");

=head1 ACCESSORS

=head2 respid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 tskid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 PrsnId

  accessor: 'prsn_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 role

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
    "respid",
    {   data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "tskid",
    {   data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "PrsnId",
    {   accessor       => "prsn_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "role",
    {data_type => "varchar", is_nullable => 1, size => 255},
);

=head1 PRIMARY KEY

=over 4

=item * L</respid>

=back

=cut

__PACKAGE__->set_primary_key("respid");

=head1 UNIQUE CONSTRAINTS

=head2 C<WhoDoesUnq>

=over 4

=item * L</tskid>

=item * L</PrsnId>

=back

=cut

__PACKAGE__->add_unique_constraint("WhoDoesUnq", ["tskid", "PrsnId"]);

=head1 RELATIONS

=head2 prsn

Type: belongs_to

Related object: L<TMS::Schema::Result::EntPerson>

=cut

__PACKAGE__->belongs_to(
    "prsn",
    "TMS::Schema::Result::EntPerson",
    {PrsnId        => "PrsnId"},
    {is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE"},
);

=head2 tskid

Type: belongs_to

Related object: L<TMS::Schema::Result::TskTask>

=cut

__PACKAGE__->belongs_to(
    "tskid",
    "TMS::Schema::Result::TskTask",
    {tskid         => "tskid"},
    {is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 08:23:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qH0il8oXMLgfaSCXSwsVaQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
