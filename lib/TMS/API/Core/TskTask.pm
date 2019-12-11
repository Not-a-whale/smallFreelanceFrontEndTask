package TMS::API::Core::TskTask;

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
use TMS::API::Core::EntPerson;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has tskid     => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has prjid     => (is => 'rw', coerce => 0, isa => 'Undef | TskTaskObj | Int ');
has PrsnId    => (is => 'rw', coerce => 1, isa => 'EntPersonObj | Int ');
has name      => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has created   => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has startdate => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has duedate   => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has completed => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has estimated => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has priority  => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has severity  => (is => 'rw', coerce => 0, isa => 'Undef | Int');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'tskid' => {
            'is_null'  => 0,
            'comment'  => 'Task ID',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'duedate' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'prjid' => {
            'is_null'  => 1,
            'comment'  => 'Parent Task or Project ID',
            'required' => 0,
            'apiclass' => 'TMS::API::Core::TskTask',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'completed' => {
            'is_null'  => 1,
            'comment'  => 'When completed',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'created' => {
            'comment'  => 'When created',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        },
        'severity' => {
            'comment'  => 'Severity: higher the number more important it is',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => '0',
            'db_type'  => 'int(11) unsigned'
        },
        'name' => {
            'is_null'  => 0,
            'comment'  => 'Short name of the task/project',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'priority' => {
            'comment'  => 'Task priority: higher then number more urgent it is',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => '0',
            'db_type'  => 'int(11) unsigned'
        },
        'startdate' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'estimated' => {
            'is_null'  => 1,
            'comment'  => 'Estimated time to complete hrs:min',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'int(11) unsigned'
        },
        'PrsnId' => {
            'comment'  => 'Who created the tsk_tasks',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::EntPerson',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

