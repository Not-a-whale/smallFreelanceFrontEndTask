package TMS::API::Core::FinBillingBank;

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
use TMS::API::Core::BizBranch;
use TMS::API::Core::FinBillingInfo;
use TMS::API::Core::GenFile;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has BankId          => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has BillingId       => (is => 'rw', coerce => 1, isa => 'FinBillingInfoObj | Int ');
has Institution     => (is => 'rw', coerce => 1, isa => 'BizBranchObj | Int ');
has AccountNickname => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has AccountNumber   => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has RoutingNumber   => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has AccountType     => (is => 'rw', coerce => 1, isa => 'Undef | EnumChecking');
has Purpose         => (is => 'rw', coerce => 1, isa => 'Undef | EnumPayment');
has Active          => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has VoidCheck       => (is => 'rw', coerce => 1, isa => 'Undef | GenFileObj | Int ');
has Notes           => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'AccountType' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'checking',
            'db_type'  => 'enum(\'checking\',\'savings\')'
        },
        'Active' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => '1',
            'db_type'  => 'tinyint(1)'
        },
        'VoidCheck' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => 'TMS::API::Core::GenFile',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'AccountNickname' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'Institution' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::BizBranch',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'BillingId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::FinBillingInfo',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'RoutingNumber' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'Purpose' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'billing and payment',
            'db_type'  => 'enum(\'payment\',\'billing\',\'billing and payment\',\'other\')'
        },
        'BankId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Notes' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'AccountNumber' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

