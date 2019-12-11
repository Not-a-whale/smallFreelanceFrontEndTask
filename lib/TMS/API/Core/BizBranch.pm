package TMS::API::Core::BizBranch;

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
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::CntAddress;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has BrnchId      => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has OfficeName   => (is => 'rw', coerce => 1, isa => 'Undef | UpperCaseStr');
has BizId        => (is => 'rw', coerce => 1, isa => 'EntBusinessObj | Int ');
has BrnchAddress => (is => 'rw', coerce => 1, isa => 'CntAddressObj | Int ');
has BrnchPhone   => (is => 'rw', coerce => 1, isa => 'CntPhonesfaxObj | Int ');
has BrnchFax     => (is => 'rw', coerce => 1, isa => 'Undef | CntPhonesfaxObj | Int ');
has BrnchEMail   => (is => 'rw', coerce => 1, isa => 'Undef | Email');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'OfficeName' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => '',
            'db_type'  => 'varchar(255)'
        },
        'BrnchEMail' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'BrnchFax' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => 'TMS::API::Core::CntPhonesfax',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'BrnchId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'BrnchPhone' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::CntPhonesfax',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'BizId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::EntBusiness',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'BrnchAddress' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::CntAddress',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

