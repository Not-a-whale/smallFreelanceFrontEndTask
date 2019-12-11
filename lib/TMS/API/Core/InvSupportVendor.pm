package TMS::API::Core::InvSupportVendor;

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
use TMS::API::Core::BizBranch;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has SupportId      => (is => 'rw', coerce => 0, isa => 'PrimaryKeyInt');
has VendorId       => (is => 'rw', coerce => 1, isa => 'BizBranchObj | Int ');
has PrimaryContact => (is => 'rw', coerce => 1, isa => 'Undef | HrAssociateObj | Int ');
has Name           => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has Description    => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'SupportId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Description' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'PrimaryContact' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'VendorId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::BizBranch',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Name' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

