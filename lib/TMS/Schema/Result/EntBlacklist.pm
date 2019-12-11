use utf8;
package TMS::Schema::Result::EntBlacklist;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::EntBlacklist

=head1 DESCRIPTION

Complaints about entities and why you should not do business with them

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<ent_blacklist>

=cut

__PACKAGE__->table("ent_blacklist");

=head1 ACCESSORS

=head2 BlackListId

  accessor: 'black_list_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 EntityId

  accessor: 'entity_id'
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

=head2 Reason

  accessor: 'reason'
  data_type: 'text'
  is_nullable: 0

=head2 Type

  accessor: 'type'
  data_type: 'enum'
  default_value: 'private'
  extra: {list => ["public","private"]}
  is_nullable: 0

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
  "EntityId",
  {
    accessor       => "entity_id",
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
  "Reason",
  { accessor => "reason", data_type => "text", is_nullable => 0 },
  "Type",
  {
    accessor      => "type",
    data_type     => "enum",
    default_value => "private",
    extra         => { list => ["public", "private"] },
    is_nullable   => 0,
  },
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

=head2 entity

Type: belongs_to

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->belongs_to(
  "entity",
  "TMS::Schema::Result::Entity",
  { EntityId => "EntityId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-10 15:38:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OTE+Jer/Bi6TZZ1I92mqxw
# These lines were loaded from '/home/cpeter/temp/lib/TMS/Schema/Result/EntBlacklist.pm' found in @INC.
# They are now part of the custom portion of this file
# for you to hand-edit.  If you do not either delete
# this section or remove that file from @INC, this section
# will be repeated redundantly when you re-create this
# file again via Loader!  See skip_load_external to disable
# this feature.

use utf8;
package TMS::Schema::Result::EntBlacklist;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::EntBlacklist

=head1 DESCRIPTION

Complaints about entities and why you should not do business with them

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<ent_blacklist>

=cut

__PACKAGE__->table("ent_blacklist");

=head1 ACCESSORS

=head2 BlackListId

  accessor: 'black_list_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 EntityId

  accessor: 'entity_id'
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

=head2 Reason

  accessor: 'reason'
  data_type: 'text'
  is_nullable: 0

=head2 Type

  accessor: 'type'
  data_type: 'enum'
  default_value: 'private'
  extra: {list => ["public","private"]}
  is_nullable: 0

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
  "EntityId",
  {
    accessor       => "entity_id",
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
  "Reason",
  { accessor => "reason", data_type => "text", is_nullable => 0 },
  "Type",
  {
    accessor      => "type",
    data_type     => "enum",
    default_value => "private",
    extra         => { list => ["public", "private"] },
    is_nullable   => 0,
  },
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

=head2 entity

Type: belongs_to

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->belongs_to(
  "entity",
  "TMS::Schema::Result::Entity",
  { EntityId => "EntityId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-10 12:29:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NI29tpNDkMQc5dWHP7Q94A


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;