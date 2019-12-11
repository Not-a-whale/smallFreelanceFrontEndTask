package TMS::API::Core::EntPerson;

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

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has PrsnId     => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has NickName   => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Prefix     => (is => 'rw', coerce => 1, isa => 'Undef | Enum');
has FirstName  => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has MiddleName => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has LastName   => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has Suffix     => (is => 'rw', coerce => 1, isa => 'Undef | EnumSr');
has BrnchId    => (is => 'rw', coerce => 1, isa => 'BizBranchObj | Int ');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'FirstName' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'varchar(64)'
        },
        'NickName' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => '',
            'db_type'  => 'varchar(512)'
        },
        'BrnchId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::BizBranch',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'LastName' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(64)'
        },
        'MiddleName' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => '',
            'db_type'  => 'varchar(64)'
        },
        'PrsnId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Prefix' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => '',
            'db_type'  => 'enum(\'\',\'Mr.\',\'Mrs.\',\'Ms.\',\'Dr.\',\'Sir\',\'Madam\')'
        },
        'Suffix' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => '',
            'db_type'  => 'enum(\'\',\'Sr\',\'Jr\',\'I\',\'II\',\'III\',\'IV\')'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

