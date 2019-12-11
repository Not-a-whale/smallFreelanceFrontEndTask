package TMS::API::Core::TskAlrm;

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
use TMS::API::Core::TskTask;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has alrmid    => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has tskid     => (is => 'rw', coerce => 1, isa => 'TskTaskObj | Int ');
has message   => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has atcrontab => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has periodic  => (is => 'rw', coerce => 1, isa => 'Undef | ENUM');
has repeat    => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has turnoff   => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'periodic' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'no',
            'db_type'  => 'enum(\'yes\',\'no\')'
        },
        'atcrontab' => {
            'comment'  => 'the AT or CRONTAB time',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'tskid' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::TskTask',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'turnoff' => {
            'is_null'  => 1,
            'comment'  => 'Turn off alarm at specific time and date',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'alrmid' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'message' => {
            'comment'  => 'message to display',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(512)'
        },
        'repeat' => {
            'is_null'  => 0,
            'comment'  => 'Limit itirations to given number. Zero means no limit.',
            'required' => 0,
            'apiclass' => undef,
            'default'  => '0',
            'db_type'  => 'int(11)'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

