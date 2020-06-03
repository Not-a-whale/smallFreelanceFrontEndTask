use utf8;

package TMS::Schema::Result::MsgCntPhonesfax;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::MsgCntPhonesfax

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<msg_cnt_phonesfaxes>

=cut

__PACKAGE__->table("msg_cnt_phonesfaxes");

=head1 ACCESSORS

=head2 idmsg_cnt_phonesfaxes

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 mnoteid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 PhnFaxId

  accessor: 'phn_fax_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "idmsg_cnt_phonesfaxes",
    {   data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "mnoteid",
    {   data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "PhnFaxId",
    {   accessor       => "phn_fax_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</idmsg_cnt_phonesfaxes>

=back

=cut

__PACKAGE__->set_primary_key("idmsg_cnt_phonesfaxes");

=head1 UNIQUE CONSTRAINTS

=head2 C<msg_cnt_phonesfaxes_unq>

=over 4

=item * L</mnoteid>

=item * L</PhnFaxId>

=back

=cut

__PACKAGE__->add_unique_constraint("msg_cnt_phonesfaxes_unq", ["mnoteid", "PhnFaxId"]);

=head1 RELATIONS

=head2 mnoteid

Type: belongs_to

Related object: L<TMS::Schema::Result::MsgNote>

=cut

__PACKAGE__->belongs_to(
    "mnoteid",
    "TMS::Schema::Result::MsgNote",
    {mnoteid       => "mnoteid"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 phn_fax

Type: belongs_to

Related object: L<TMS::Schema::Result::CntPhonesfax>

=cut

__PACKAGE__->belongs_to(
    "phn_fax",
    "TMS::Schema::Result::CntPhonesfax",
    {PhnFaxId      => "PhnFaxId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 20:08:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ShHY4Aopgh/qU03H32hZew

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
