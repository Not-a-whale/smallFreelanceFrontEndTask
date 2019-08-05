use utf8;
package TMS::Schema::Result::TskNtfi;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::TskNtfi - Who to notify when alarm triggers

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<tsk_ntfis>

=cut

__PACKAGE__->table("tsk_ntfis");

=head1 ACCESSORS

=head2 alrtid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 PrsnId

  accessor: 'prsn_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 alrmid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "alrtid",
  {
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "PrsnId",
  {
    accessor       => "prsn_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "alrmid",
  {
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</alrtid>

=back

=cut

__PACKAGE__->set_primary_key("alrtid");

=head1 RELATIONS

=head2 alrmid

Type: belongs_to

Related object: L<TMS::Schema::Result::TskAlrm>

=cut

__PACKAGE__->belongs_to(
  "alrmid",
  "TMS::Schema::Result::TskAlrm",
  { alrmid => "alrmid" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 prsn

Type: belongs_to

Related object: L<TMS::Schema::Result::EntPerson>

=cut

__PACKAGE__->belongs_to(
  "prsn",
  "TMS::Schema::Result::EntPerson",
  { PrsnId => "PrsnId" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HqUhlghltimZ66csSw/BeA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;