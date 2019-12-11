package TMS::API::Core::DrvSchedule;

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
use TMS::API::Core::DrvDesttype;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::DrvDriver;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has DrvSchdId       => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has DriverId        => (is => 'rw', coerce => 1, isa => 'DrvDriverObj | Int ');
has ChangeDate      => (is => 'rw', coerce => 1, isa => 'DATETIME');
has DesiredDestId   => (is => 'rw', coerce => 1, isa => 'DrvDesttypeObj | Int ');
has DesiredDestNote => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has PostedBy        => (is => 'rw', coerce => 1, isa => 'HrAssociateObj | Int ');
has PostedDate      => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');

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
        'DesiredDestNote' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'PostedBy' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DrvSchdId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DesiredDestId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::DrvDesttype',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'ChangeDate' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'PostedDate' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

