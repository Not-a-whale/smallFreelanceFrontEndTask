use utf8;
package TMS::Schema::Result::DspBlacklist;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DspBlacklist

=head1 DESCRIPTION

Complaints about entities and why you should not do business with them

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<dsp_blacklist>

=cut

__PACKAGE__->table("dsp_blacklist");

=head1 ACCESSORS

=head2 BlackListId

  accessor: 'black_list_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 CstmrId

  accessor: 'cstmr_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 Creator

  accessor: 'creator'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 ReasonPublic

  accessor: 'reason_public'
  data_type: 'text'
  is_nullable: 0

=head2 ReasonPrivate

  accessor: 'reason_private'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "BlackListId",
  {
    accessor => "black_list_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "CstmrId",
  {
    accessor       => "cstmr_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "DateCreated",
  {
    accessor => "date_created",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "Creator",
  {
    accessor       => "creator",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "ReasonPublic",
  { accessor => "reason_public", data_type => "text", is_nullable => 0 },
  "ReasonPrivate",
  { accessor => "reason_private", data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</BlackListId>

=back

=cut

__PACKAGE__->set_primary_key("BlackListId");

=head1 RELATIONS

=head2 creator

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
  "creator",
  "TMS::Schema::Result::HrAssociate",
  { AstId => "Creator" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 cstmr

Type: belongs_to

Related object: L<TMS::Schema::Result::EntCustomer>

=cut

__PACKAGE__->belongs_to(
  "cstmr",
  "TMS::Schema::Result::EntCustomer",
  { CstmrId => "CstmrId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-13 13:28:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TEQ6VkXwa9JGCjTq2Y83/w


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;