package TMS::API::Core::DspLoadsDestination;

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
use TMS::API::Core::DspLoad;
use TMS::API::Core::BizBranch;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has DestinationId    => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has LoadId           => (is => 'rw', coerce => 1, isa => 'DspLoadObj | Int ');
has PU_PO            => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has Commodity        => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has Pallets          => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has Pieces           => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has Weight           => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has AppointmentStart => (is => 'rw', coerce => 1, isa => 'DATETIME');
has AppointmentEnd   => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has AppointmentType  => (is => 'rw', coerce => 1, isa => 'EnumAppointment');
has StopOrder        => (is => 'rw', coerce => 0, isa => 'Undef | Int');
has StopType         => (is => 'rw', coerce => 1, isa => 'EnumPickup');
has Branch           => (is => 'rw', coerce => 1, isa => 'BizBranchObj | Int ');
has AppointmentNotes => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'AppointmentStart' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'StopType' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'enum(\'PickUp\',\'DropOff\')'
        },
        'Weight' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'float'
        },
        'DestinationId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'AppointmentType' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'enum(\'Appointment\',\'Time Open\')'
        },
        'AppointmentNotes' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'Pallets' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'int(11)'
        },
        'LoadId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => 'TMS::API::Core::DspLoad',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'StopOrder' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => '0',
            'db_type'  => 'int(11)'
        },
        'Pieces' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'int(11)'
        },
        'PU_PO' => {
            'is_null'  => 0,
            'comment'  => 'PU#/PO# ????',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'Commodity' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'Branch' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::BizBranch',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'AppointmentEnd' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'datetime'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

