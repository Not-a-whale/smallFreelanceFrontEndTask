use utf8;

package TMS::Schema::Result::EntPerson;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::EntPerson

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<ent_people>

=cut

__PACKAGE__->table("ent_people");

=head1 ACCESSORS

=head2 PrsnId

  accessor: 'prsn_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 NickName

  accessor: 'nick_name'
  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 512

=head2 Prefix

  accessor: 'prefix'
  data_type: 'enum'
  default_value: (empty string)
  extra: {list => ["","Mr.","Mrs.","Ms.","Dr.","Sir","Madam"]}
  is_nullable: 0

=head2 FirstName

  accessor: 'first_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 MiddleName

  accessor: 'middle_name'
  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 LastName

  accessor: 'last_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 Suffix

  accessor: 'suffix'
  data_type: 'enum'
  default_value: (empty string)
  extra: {list => ["","Sr","Jr","I","II","III","IV"]}
  is_nullable: 0

=head2 BrnchId

  accessor: 'brnch_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "PrsnId",
    {   accessor          => "prsn_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "NickName",
    {   accessor      => "nick_name",
        data_type     => "varchar",
        default_value => "",
        is_nullable   => 0,
        size          => 512,
    },
    "Prefix",
    {   accessor      => "prefix",
        data_type     => "enum",
        default_value => "",
        extra         => {list => ["", "Mr.", "Mrs.", "Ms.", "Dr.", "Sir", "Madam"]},
        is_nullable   => 0,
    },
    "FirstName",
    {   accessor    => "first_name",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 64,
    },
    "MiddleName",
    {   accessor      => "middle_name",
        data_type     => "varchar",
        default_value => "",
        is_nullable   => 0,
        size          => 64,
    },
    "LastName",
    {   accessor    => "last_name",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 64,
    },
    "Suffix",
    {   accessor      => "suffix",
        data_type     => "enum",
        default_value => "",
        extra         => {list => ["", "Sr", "Jr", "I", "II", "III", "IV"]},
        is_nullable   => 0,
    },
    "BrnchId",
    {   accessor       => "brnch_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</PrsnId>

=back

=cut

__PACKAGE__->set_primary_key("PrsnId");

=head1 UNIQUE CONSTRAINTS

=head2 C<UniqFullName>

=over 4

=item * L</Prefix>

=item * L</FirstName>

=item * L</MiddleName>

=item * L</LastName>

=item * L</Suffix>

=item * L</BrnchId>

=item * L</NickName>

=back

=cut

__PACKAGE__->add_unique_constraint("UniqFullName",
    ["Prefix", "FirstName", "MiddleName", "LastName", "Suffix", "BrnchId", "NickName",],
);

=head1 RELATIONS

=head2 brnch

Type: belongs_to

Related object: L<TMS::Schema::Result::BizBranch>

=cut

__PACKAGE__->belongs_to(
    "brnch",
    "TMS::Schema::Result::BizBranch",
    {BrnchId       => "BrnchId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 entity

Type: might_have

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->might_have(
    "entity", "TMS::Schema::Result::Entity",
    {"foreign.PersonId" => "self.PrsnId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

=head2 hr_associate

Type: might_have

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->might_have(
    "hr_associate",
    "TMS::Schema::Result::HrAssociate",
    {"foreign.AstId" => "self.PrsnId"},
    {cascade_copy    => 0, cascade_delete => 0},
);

=head2 tsk_actns

Type: has_many

Related object: L<TMS::Schema::Result::TskActn>

=cut

__PACKAGE__->has_many(
    "tsk_actns",
    "TMS::Schema::Result::TskActn",
    {"foreign.PrsnId" => "self.PrsnId"},
    {cascade_copy     => 0, cascade_delete => 0},
);

=head2 tsk_ntfis

Type: has_many

Related object: L<TMS::Schema::Result::TskNtfi>

=cut

__PACKAGE__->has_many(
    "tsk_ntfis",
    "TMS::Schema::Result::TskNtfi",
    {"foreign.PrsnId" => "self.PrsnId"},
    {cascade_copy     => 0, cascade_delete => 0},
);

=head2 tsk_resps

Type: has_many

Related object: L<TMS::Schema::Result::TskResp>

=cut

__PACKAGE__->has_many(
    "tsk_resps",
    "TMS::Schema::Result::TskResp",
    {"foreign.PrsnId" => "self.PrsnId"},
    {cascade_copy     => 0, cascade_delete => 0},
);

=head2 tsk_tasks

Type: has_many

Related object: L<TMS::Schema::Result::TskTask>

=cut

__PACKAGE__->has_many(
    "tsk_tasks",
    "TMS::Schema::Result::TskTask",
    {"foreign.PrsnId" => "self.PrsnId"},
    {cascade_copy     => 0, cascade_delete => 0},
);

=head2 tsk_times

Type: has_many

Related object: L<TMS::Schema::Result::TskTime>

=cut

__PACKAGE__->has_many(
    "tsk_times",
    "TMS::Schema::Result::TskTime",
    {"foreign.PrsnId" => "self.PrsnId"},
    {cascade_copy     => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-24 07:43:32
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:n1ka9bOngMrEmZS+OnmfMg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
