package TMS::API::Core::DspLoadsDestinationsDoc;

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
use TMS::API::Core::GenFile;
use TMS::API::Core::DspLoadsDestination;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has DestFileId        => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has LoadDestinationId => (is => 'rw', coerce => 1, isa => 'DspLoadsDestinationObj | Int ');
has FileId            => (is => 'rw', coerce => 1, isa => 'GenFileObj | Int ');
has Verified          => (is => 'rw', coerce => 1, isa => 'EnumUnknown');
has ApprovedBy        => (is => 'rw', coerce => 1, isa => 'HrAssociateObj | Int ');
has FactoredDoc       => (is => 'rw', coerce => 1, isa => 'Undef | BoolInt');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'FactoredDoc' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => '0',
            'db_type'  => 'tinyint(4) unsigned'
        },
        'Verified' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'enum(\'unknown\',\'yes\',\'no\')'
        },
        'ApprovedBy' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'LoadDestinationId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::DspLoadsDestination',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DestFileId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'FileId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::GenFile',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

