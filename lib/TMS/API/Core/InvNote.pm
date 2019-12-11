package TMS::API::Core::InvNote;

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
use TMS::API::Core::InvEquipment;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has EqNoteId    => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has EquipmentId => (is => 'rw', coerce => 1, isa => 'InvEquipmentObj | Int ');
has DateCreated => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has PostedBy    => (is => 'rw', coerce => 1, isa => 'HrAssociateObj | Int ');
has Notes       => (is => 'rw', coerce => 1, isa => 'TidySpacesString');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'EquipmentId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::InvEquipment',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'PostedBy' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'EqNoteId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Notes' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'DateCreated' => {
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

