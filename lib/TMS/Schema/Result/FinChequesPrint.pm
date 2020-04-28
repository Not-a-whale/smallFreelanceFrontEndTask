use utf8;

package TMS::Schema::Result::FinChequesPrint;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinChequesPrint

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_cheques_prints>

=cut

__PACKAGE__->table("fin_cheques_prints");

=head1 ACCESSORS

=head2 PrintedBy

  accessor: 'printed_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 ChequeId

  accessor: 'cheque_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DatePrinted

  accessor: 'date_printed'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "PrintedBy",
    {   accessor       => "printed_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "ChequeId",
    {   accessor       => "cheque_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "DatePrinted",
    {   accessor                  => "date_printed",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
);

=head1 RELATIONS

=head2 cheque

Type: belongs_to

Related object: L<TMS::Schema::Result::FinCheque>

=cut

__PACKAGE__->belongs_to(
    "cheque",
    "TMS::Schema::Result::FinCheque",
    {ChequeId      => "ChequeId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 printed_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "printed_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "PrintedBy"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-04-28 11:12:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pilBz/jekY7KJ4zGmR1eFg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
