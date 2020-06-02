use utf8;

package TMS::Schema::Result::DrvCdlEndorsement;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DrvCdlEndorsement

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<drv_cdl_endorsements>

=cut

__PACKAGE__->table("drv_cdl_endorsements");

=head1 ACCESSORS

=head2 EndrsId

  accessor: 'endrs_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 Endorsement

  accessor: 'endorsement'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 ValidFromDate

  accessor: 'valid_from_date'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 ExpiredDate

  accessor: 'expired_date'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "EndrsId",
    {   accessor          => "endrs_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "Endorsement",
    {   accessor    => "endorsement",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
    "ValidFromDate",
    {   accessor                  => "valid_from_date",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "ExpiredDate",
    {   accessor                  => "expired_date",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</EndrsId>

=back

=cut

__PACKAGE__->set_primary_key("EndrsId");

=head1 RELATIONS

=head2 drv_driverlicences

Type: has_many

Related object: L<TMS::Schema::Result::DrvDriverlicence>

=cut

__PACKAGE__->has_many(
    "drv_driverlicences", "TMS::Schema::Result::DrvDriverlicence",
    {"foreign.DrLcEndorsement" => "self.EndrsId"}, {cascade_copy => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 13:19:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Wno2QJw7hlYmuIiDsVK5Eg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
