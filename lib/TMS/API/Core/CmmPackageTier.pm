package TMS::API::Core::CmmPackageTier;

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
use TMS::API::Core::CmmPackage;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has TierId     => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has Package    => (is => 'rw', coerce => 1, isa => 'CmmPackageObj | Int ');
has Name       => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has Percentage => (is => 'rw', coerce => 1, isa => 'Float');
has Threshold  => (is => 'rw', coerce => 1, isa => 'Undef | Float');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'Threshold' => {
            'comment'  => 'The minimum amount required for the tier to be in effect',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'decimal(12,2)'
        },
        'Percentage' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'decimal(5,2) unsigned'
        },
        'Package' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::CmmPackage',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'Name' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'TierId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

