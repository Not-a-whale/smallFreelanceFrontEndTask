use utf8;
package TMS::Schema::Result::SftIfta;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::SftIfta

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<sft_ifta>

=cut

__PACKAGE__->table("sft_ifta");

=head1 ACCESSORS

=head2 IFTAId

  accessor: 'iftaid'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "IFTAId",
  {
    accessor => "iftaid",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</IFTAId>

=back

=cut

__PACKAGE__->set_primary_key("IFTAId");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:X3dYw4XhSMZNNZWF0EOVwA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;