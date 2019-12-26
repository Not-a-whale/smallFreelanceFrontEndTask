use utf8;

package TMS::Schema::Result::FinJob;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinJob

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_jobs>

=cut

__PACKAGE__->table("fin_jobs");

=head1 ACCESSORS

=head2 JobId

  accessor: 'job_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 Title

  accessor: 'title'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 JobAddedBy

  accessor: 'job_added_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 JobCreated

  accessor: 'job_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "JobId",
    {   accessor          => "job_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "Title",
    {accessor => "title", data_type => "varchar", is_nullable => 1, size => 255},
    "JobAddedBy",
    {   accessor    => "job_added_by",
        data_type   => "bigint",
        extra       => {unsigned => 1},
        is_nullable => 0,
    },
    "JobCreated",
    {   accessor                  => "job_created",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</JobId>

=back

=cut

__PACKAGE__->set_primary_key("JobId");

=head1 RELATIONS

=head2 dsp_loads

Type: has_many

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->has_many(
    "dsp_loads",
    "TMS::Schema::Result::DspLoad",
    {"foreign.Job" => "self.JobId"},
    {cascade_copy  => 0, cascade_delete => 0},
);

=head2 fin_invoices_items

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoicesItem>

=cut

__PACKAGE__->has_many(
    "fin_invoices_items", "TMS::Schema::Result::FinInvoicesItem",
    {"foreign.JobId" => "self.JobId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_journal_entries

Type: has_many

Related object: L<TMS::Schema::Result::FinJournalEntry>

=cut

__PACKAGE__->has_many(
    "fin_journal_entries", "TMS::Schema::Result::FinJournalEntry",
    {"foreign.JobId" => "self.JobId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_transactions

Type: has_many

Related object: L<TMS::Schema::Result::FinTransaction>

=cut

__PACKAGE__->has_many(
    "fin_transactions", "TMS::Schema::Result::FinTransaction",
    {"foreign.JobId" => "self.JobId"}, {cascade_copy => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-25 21:12:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SY30xq2jCItM/QfS2fLRDA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
