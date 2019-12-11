package TMS::API::Core::DspTripsLoad;

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
use TMS::API::Core::DspTrip;
use TMS::API::Core::DspLoad;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has TripLoadId     => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has TripId         => (is => 'rw', coerce => 1, isa => 'DspTripObj | Int ');
has LoadId         => (is => 'rw', coerce => 1, isa => 'DspLoadObj | Int ');
has DateDispatched => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has LoadDispatcher => (is => 'rw', coerce => 1, isa => 'HrAssociateObj | Int ');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'LoadDispatcher' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DateDispatched' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        },
        'TripLoadId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'LoadId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::DspLoad',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'TripId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::DspTrip',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

