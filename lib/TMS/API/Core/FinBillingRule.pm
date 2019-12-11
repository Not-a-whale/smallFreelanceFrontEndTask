package TMS::API::Core::FinBillingRule;

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
use TMS::API::Core::FinBillingBank;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has BillRuleId  => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has BankAccount => (is => 'rw', coerce => 1, isa => 'FinBillingBankObj | Int ');
has Rule        => (is => 'rw', coerce => 1, isa => 'Undef | EnumPercentage');
has Amount      => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has Notes       => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Active      => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'Active' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'tinyint(1)'
        },
        'BankAccount' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::FinBillingBank',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'BillRuleId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Rule' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'percentage',
            'db_type'  => 'enum(\'percentage\',\'fixed amount\')'
        },
        'Notes' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'Amount' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => '100.00',
            'db_type'  => 'decimal(12,2)'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

