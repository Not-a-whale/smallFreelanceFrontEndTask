package TMS::API::Core::DspTrip;

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
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has TripId         => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has CreatedBy      => (is => 'rw', coerce => 1, isa => 'HrAssociateObj | Int ');
has TripNumber     => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has DateCreated    => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has DateStarted    => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has DateCompleted  => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has DateBooked     => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has DateDispatched => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has IsValid        => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');
has TripStatus     => (is => 'rw', coerce => 1, isa => 'EnumPending');
has Notes          => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has GoogleRoute    => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'DateCompleted' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'CreatedBy' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DateDispatched' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'TripStatus' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type' =>
                'enum(\'Pending\',\'Dispatched\',\'Complete\',\'Other\',\'TONU\',\'Cancelled\')'
        },
        'GoogleRoute' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'TripId' => {
            'is_null'  => 0,
            'comment'  => 'For financial purposes TripNumber === JobNumber, TripId === JobId',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DateStarted' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'TripNumber' => {
            'comment'  => 'For financial purposes TripNumber === JobNumber, TripId === JobId',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(12)'
        },
        'DateBooked' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'IsValid' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => '1',
            'db_type'  => 'tinyint(1) unsigned'
        },
        'DateCreated' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        },
        'Notes' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'text'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

