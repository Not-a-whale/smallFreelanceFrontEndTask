package TMS::API::Core::SftLogEntry;

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
use TMS::API::Core::SftLogbook;
use TMS::API::Core::SftElogStat;
use TMS::API::Core::DrvDriver;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has LogbookEntryId => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has LogbookId      => (is => 'rw', coerce => 1, isa => 'SftLogbookObj | Int ');
has Location       => (is => 'rw', coerce => 1, isa => 'Undef | SftElogStatObj | Int ');
has StartTime      => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has Activity       => (is => 'rw', coerce => 1, isa => 'EnumOnDuty');
has DriverId       => (is => 'rw', coerce => 1, isa => 'DrvDriverObj | Int ');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'DriverId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::DrvDriver',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'LogbookId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::SftLogbook',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'LogbookEntryId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Location' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::SftElogStat',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Activity' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'enum(\'ON DUTY\',\'OFF DUTY\',\'DRIVING\',\'SLEEPING\')'
        },
        'StartTime' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

