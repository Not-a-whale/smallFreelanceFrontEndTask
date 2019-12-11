package TMS::API::Core::FinScheduledDeduction;

# $Id: $
use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use Moose;

# AUTO-GENERATED DEPENDENCIES START
use TMS::API::Core::Entity;
use TMS::API::Core::FinItemTemplate;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has SchedDeductionId => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has ItemTemplateId   => (is => 'rw', coerce => 1, isa => 'FinItemTemplateObj | Int ');
has EntityId         => (is => 'rw', coerce => 1, isa => 'EntityObj | Int ');
has DateStart        => (is => 'rw', coerce => 1, isa => 'DATE');
has DateStop         => (is => 'rw', coerce => 1, isa => 'Undef | DATE');
has PaymentAmount    => (is => 'rw', coerce => 1, isa => 'Float');
has CumulativeAmount => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has TotalAmount      => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has Comments         => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has ScheduleType     => (is => 'rw', coerce => 1, isa => 'Undef | EnumLoan');
has Period           => (is => 'rw', coerce => 1, isa => 'Undef | EnumNull');
has PeriodDay        => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has Valid            => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has CreatedBy        => (is => 'rw', coerce => 1, isa => 'HrAssociateObj | Int ');
has DateCreated      => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'PaymentAmount' => {
            'comment'  => 'How much to pay per peroid',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'decimal(12,2)'
        },
        'DateStart' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'date'
        },
        'CreatedBy' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'ScheduleType' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'one-time charge',
            'db_type'  => 'enum(\'loan\',\'one-time charge\',\'recurring charge\')'
        },
        'CumulativeAmount' => {
            'comment' =>
                'The amount charged so far for this particular scheduled deduction item for the entity',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => '0.00',
            'db_type'  => 'decimal(12,2)'
        },
        'ItemTemplateId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::FinItemTemplate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'SchedDeductionId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Comments' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'Period' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'null',
            'db_type' =>
                'enum(\'null\',\'annually\',\'bi-annually\',\'quarterly\',\'monthly\',\'bi-monthly\',\'weekly\',\'bi-weekly\',\'daily\')'
        },
        'PeriodDay' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'Valid' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => '1',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'TotalAmount' => {
            'comment'  => 'Total amount to charge can be null if there is no limit to reach',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'decimal(12,2)'
        },
        'DateStop' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'date'
        },
        'EntityId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::Entity',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DateCreated' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

