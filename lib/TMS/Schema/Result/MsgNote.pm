use utf8;

package TMS::Schema::Result::MsgNote;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::MsgNote

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<msg_notes>

=cut

__PACKAGE__->table("msg_notes");

=head1 ACCESSORS

=head2 mnoteid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 subject

  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 body

  data_type: 'text'
  is_nullable: 0

=head2 posted

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 author

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 sourcetable

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 sourceid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

record id from the source table

=head2 macsid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 keywords

  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=cut

__PACKAGE__->add_columns(
    "mnoteid",
    {   data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "subject",
    {data_type => "varchar", is_nullable => 1, size => 1024},
    "body",
    {data_type => "text", is_nullable => 0},
    "posted",
    {   data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "author",
    {   data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "sourcetable",
    {data_type => "varchar", is_nullable => 0, size => 64},
    "sourceid",
    {data_type => "bigint", extra => {unsigned => 1}, is_nullable => 0},
    "macsid",
    {   data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "keywords",
    {data_type => "varchar", is_nullable => 1, size => 1024},
);

=head1 PRIMARY KEY

=over 4

=item * L</mnoteid>

=back

=cut

__PACKAGE__->set_primary_key("mnoteid");

=head1 RELATIONS

=head2 author

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "author",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "author"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 macsid

Type: belongs_to

Related object: L<TMS::Schema::Result::MsgAccess>

=cut

__PACKAGE__->belongs_to(
    "macsid",
    "TMS::Schema::Result::MsgAccess",
    {macsid        => "macsid"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 08:23:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:10ATn5ZmTY0yyh3RoMn+Vw

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
