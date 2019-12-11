package TMS::API::Core::EntCustomer;

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
use TMS::API::Core::EntBusiness;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has CstmrId          => (is => 'rw', coerce => 1, isa => 'EntBusinessObj | Int ');
has MC               => (is => 'rw', coerce => 1, isa => 'Undef | MCnum');
has DOT              => (is => 'rw', coerce => 1, isa => 'Undef | DOTnum');
has SCAC             => (is => 'rw', coerce => 1, isa => 'Undef | SCAC');
has Terms            => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Factoring        => (is => 'rw', coerce => 1, isa => 'Undef | EnumYes');
has CreditLimit      => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has Bond             => (is => 'rw', coerce => 1, isa => 'Undef | Bonds');
has DUNS             => (is => 'rw', coerce => 1, isa => 'Undef | DUNS');
has DontUse          => (is => 'rw', coerce => 1, isa => 'Undef | EnumDoNotUse');
has WhyDontUse       => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has RequireOriginals => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'Factoring' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'enum(\'yes\',\'no\')'
        },
        'MC' => {
            'comment'  => 'MC number',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(10)'
        },
        'Bond' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(64)'
        },
        'CreditLimit' => {
            'comment'  => 'Credit Limit',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'decimal(10,2) unsigned'
        },
        'RequireOriginals' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => '0',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'SCAC' => {
            'comment'  => 'SCACC',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'Terms' => {
            'comment'  => 'Payment terms',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'DUNS' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'char(9)'
        },
        'WhyDontUse' => {
            'comment'  => 'Why do not use',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'CstmrId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => 'TMS::API::Core::EntBusiness',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DOT' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(15)'
        },
        'DontUse' => {
            'comment'  => 'Do not use',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'enum(\'do not use\',\'can use\')'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

