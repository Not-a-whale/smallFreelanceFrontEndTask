use utf8;

package TMS::Schema::Result::HrEmrgencyContact;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::HrEmrgencyContact

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<hr_emrgency_contacts>

=cut

__PACKAGE__->table("hr_emrgency_contacts");

=head1 ACCESSORS

=head2 EmrgncyId

  accessor: 'emrgncy_id'
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

=head2 ContactName

  accessor: 'contact_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 ContactPhone

  accessor: 'contact_phone'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Relationship

  accessor: 'relationship'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 Effective

  accessor: 'effective'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 Expired

  accessor: 'expired'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "EmrgncyId",
    {   accessor          => "emrgncy_id",
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
    "ContactName",
    {   accessor    => "contact_name",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
    "ContactPhone",
    {   accessor       => "contact_phone",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "Relationship",
    {   accessor    => "relationship",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
    "Effective",
    {   accessor                  => "effective",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "Expired",
    {   accessor                  => "expired",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "Notes",
    {accessor => "notes", data_type => "text", is_nullable => 1},
);

=head1 PRIMARY KEY

=over 4

=item * L</EmrgncyId>

=back

=cut

__PACKAGE__->set_primary_key("EmrgncyId");

=head1 RELATIONS

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

=head2 contact_phone

Type: belongs_to

Related object: L<TMS::Schema::Result::CntPhonesfax>

=cut

__PACKAGE__->belongs_to(
    "contact_phone",
    "TMS::Schema::Result::CntPhonesfax",
    {PhnFaxId      => "ContactPhone"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-25 21:12:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pbO5gWJ68ASfT347wuaSxg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
