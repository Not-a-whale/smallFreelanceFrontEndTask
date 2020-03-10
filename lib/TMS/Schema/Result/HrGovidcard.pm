use utf8;

package TMS::Schema::Result::HrGovidcard;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::HrGovidcard

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<hr_govidcards>

=cut

__PACKAGE__->table("hr_govidcards");

=head1 ACCESSORS

=head2 CardId

  accessor: 'card_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 AstId

  accessor: 'ast_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 CardNumber

  accessor: 'card_number'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 CardDateExpired

  accessor: 'card_date_expired'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 CardDateValid

  accessor: 'card_date_valid'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 CardSate

  accessor: 'card_sate'
  data_type: 'char'
  is_nullable: 0
  size: 2

=head2 CardType

  accessor: 'card_type'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 Photo

  accessor: 'photo'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 AddedBy

  accessor: 'added_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "CardId",
    {   accessor          => "card_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "AstId",
    {   accessor       => "ast_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "CardNumber",
    {   accessor    => "card_number",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
    "CardDateExpired",
    {   accessor                  => "card_date_expired",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "CardDateValid",
    {   accessor                  => "card_date_valid",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "CardSate",
    {accessor => "card_sate", data_type => "char", is_nullable => 0, size => 2},
    "CardType",
    {   accessor    => "card_type",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
    "Photo",
    {   accessor       => "photo",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "AddedBy",
    {   accessor       => "added_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</CardId>

=back

=cut

__PACKAGE__->set_primary_key("CardId");

=head1 RELATIONS

=head2 added_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "added_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "AddedBy"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 ast

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "ast",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "AstId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 hr_hire_records

Type: has_many

Related object: L<TMS::Schema::Result::HrHireRecord>

=cut

__PACKAGE__->has_many(
    "hr_hire_records",
    "TMS::Schema::Result::HrHireRecord",
    {"foreign.EmploymentAuthorization" => "self.CardId"},
    {cascade_copy                      => 0, cascade_delete => 0},
);

=head2 photo

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
    "photo",
    "TMS::Schema::Result::GenFile",
    {FileId => "Photo"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-03-10 16:28:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1ndW961ZGvnokju6M6QC9Q

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
