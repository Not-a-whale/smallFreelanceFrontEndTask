package TMS::API::Core::CntPhonesfax;

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

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has PhnFaxId  => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has Number    => (is => 'rw', coerce => 1, isa => 'PhoneNumber');
has Extension => (is => 'rw', coerce => 1, isa => 'Undef | PhoneExt');
has Features  => (is => 'rw', coerce => 1, isa => 'Undef | SetVoice');
has Mobility  => (is => 'rw', coerce => 1, isa => 'Undef | EnumLandLine');
has Notes     => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'Number' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'varchar(12)'
        },
        'Extension' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => '0',
            'db_type'  => 'varchar(10)'
        },
        'Mobility' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'LAND LINE',
            'db_type'  => 'enum(\'LAND LINE\',\'MOBILE\',\'SOFT PHONE\')'
        },
        'PhnFaxId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Features' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => 'VOICE',
            'db_type'  => 'set(\'VOICE\',\'SMS\',\'MMS\',\'FAX\')'
        },
        'Notes' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'text'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

