use utf8;

package TMS::Schema::Result::FinScheduledDeduction;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinScheduledDeduction

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_scheduled_deductions>

=cut

__PACKAGE__->table("fin_scheduled_deductions");

=head1 ACCESSORS

=head2 SchedDeductionId

  accessor: 'sched_deduction_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 ItemTemplateId

  accessor: 'item_template_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 EntityId

  accessor: 'entity_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DateStart

  accessor: 'date_start'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 DateStop

  accessor: 'date_stop'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 PaymentAmount

  accessor: 'payment_amount'
  data_type: 'decimal'
  is_nullable: 0
  size: [12,2]

How much to pay per peroid

=head2 CumulativeAmount

  accessor: 'cumulative_amount'
  data_type: 'decimal'
  default_value: 0.00
  is_nullable: 0
  size: [12,2]

The amount charged so far for this particular scheduled deduction item for the entity

=head2 TotalAmount

  accessor: 'total_amount'
  data_type: 'decimal'
  is_nullable: 1
  size: [12,2]

Total amount to charge can be null if there is no limit to reach

=head2 Comments

  accessor: 'comments'
  data_type: 'text'
  is_nullable: 1

=head2 ScheduleType

  accessor: 'schedule_type'
  data_type: 'enum'
  default_value: 'one-time charge'
  extra: {list => ["loan","one-time charge","recurring charge"]}
  is_nullable: 0

=head2 Period

  accessor: 'period'
  data_type: 'enum'
  default_value: 'null'
  extra: {list => ["null","annually","bi-annually","quarterly","monthly","bi-monthly","weekly","bi-weekly","daily"]}
  is_nullable: 1

=head2 PeriodDay

  accessor: 'period_day'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 Valid

  accessor: 'valid'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 CreatedBy

  accessor: 'created_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "SchedDeductionId",
    {   accessor          => "sched_deduction_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "ItemTemplateId",
    {   accessor       => "item_template_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "EntityId",
    {   accessor       => "entity_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "DateStart",
    {   accessor                  => "date_start",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "DateStop",
    {   accessor                  => "date_stop",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "PaymentAmount",
    {   accessor    => "payment_amount",
        data_type   => "decimal",
        is_nullable => 0,
        size        => [12, 2],
    },
    "CumulativeAmount",
    {   accessor      => "cumulative_amount",
        data_type     => "decimal",
        default_value => "0.00",
        is_nullable   => 0,
        size          => [12, 2],
    },
    "TotalAmount",
    {   accessor    => "total_amount",
        data_type   => "decimal",
        is_nullable => 1,
        size        => [12, 2],
    },
    "Comments",
    {accessor => "comments", data_type => "text", is_nullable => 1},
    "ScheduleType",
    {   accessor      => "schedule_type",
        data_type     => "enum",
        default_value => "one-time charge",
        extra         => {list => ["loan", "one-time charge", "recurring charge"]},
        is_nullable   => 0,
    },
    "Period",
    {   accessor      => "period",
        data_type     => "enum",
        default_value => "null",
        extra =>
            {list => ["null", "annually", "bi-annually", "quarterly", "monthly", "bi-monthly", "weekly", "bi-weekly", "daily",],},
        is_nullable => 1,
    },
    "PeriodDay",
    {   accessor    => "period_day",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "Valid",
    {   accessor      => "valid",
        data_type     => "tinyint",
        default_value => 1,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
    "CreatedBy",
    {   accessor       => "created_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "DateCreated",
    {   accessor                  => "date_created",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</SchedDeductionId>

=back

=cut

__PACKAGE__->set_primary_key("SchedDeductionId");

=head1 RELATIONS

=head2 created_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "created_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "CreatedBy"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 entity

Type: belongs_to

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->belongs_to(
    "entity", "TMS::Schema::Result::Entity",
    {EntityId      => "EntityId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 item_template

Type: belongs_to

Related object: L<TMS::Schema::Result::FinItemTemplate>

=cut

__PACKAGE__->belongs_to(
    "item_template",
    "TMS::Schema::Result::FinItemTemplate",
    {ItemTemplateId => "ItemTemplateId"},
    {is_deferrable  => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 08:23:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yMnc23Db4haem00RFY3vNQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
