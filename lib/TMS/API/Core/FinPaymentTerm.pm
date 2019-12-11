package TMS::API::Core::FinPaymentTerm;

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

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has PaymentTermId   => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has Name            => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has DueNext         => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has DueInDays       => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has DiscountAmount  => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has DiscountPercent => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has DiscountInDays  => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has Type            => (is => 'rw', coerce => 1, isa => 'EnumStandard');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'PaymentTermId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DiscountAmount' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'decimal(12,2)'
        },
        'DiscountPercent' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'decimal(12,2)'
        },
        'DueInDays' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'int(11)'
        },
        'Type' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'enum(\'STANDARD\',\'BY DATE\',\'CASH\')'
        },
        'DueNext' => {
            'is_null'  => 1,
            'comment'  => 'Net 7, 10, 30, 60, 90',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'int(11)'
        },
        'DiscountInDays' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'Name' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(1024)'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

