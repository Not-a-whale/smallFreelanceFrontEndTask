use utf8;

package TMS::Schema::Result::TskTime;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::TskTime

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<tsk_times>

=cut

__PACKAGE__->table("tsk_times");

=head1 ACCESSORS

=head2 tmeid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 actid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 PrsnId

  accessor: 'prsn_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 started

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 finished

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 duration

  data_type: 'time'
  is_nullable: 1

=head2 fulllength

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "tmeid",
    {   data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "actid",
    {   data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "PrsnId",
    {   accessor       => "prsn_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "started",
    {   data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "finished",
    {   data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "duration",
    {data_type => "time", is_nullable => 1},
    "fulllength",
    {data_type => "integer", is_nullable => 1},
);

=head1 PRIMARY KEY

=over 4

=item * L</tmeid>

=back

=cut

__PACKAGE__->set_primary_key("tmeid");

=head1 RELATIONS

=head2 actid

Type: belongs_to

Related object: L<TMS::Schema::Result::TskActn>

=cut

__PACKAGE__->belongs_to(
    "actid",
    "TMS::Schema::Result::TskActn",
    {actid         => "actid"},
    {is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE"},
);

=head2 prsn

Type: belongs_to

Related object: L<TMS::Schema::Result::EntPerson>

=cut

__PACKAGE__->belongs_to(
    "prsn",
    "TMS::Schema::Result::EntPerson",
    {PrsnId        => "PrsnId"},
    {is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-25 21:12:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:30E6uz9S1Y1R+dKwYvc6TA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
