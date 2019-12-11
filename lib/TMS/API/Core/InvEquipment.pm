package TMS::API::Core::InvEquipment;

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
use TMS::API::Core::InvEquipmentType;
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
has EquipmentId    => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has GeneralName    => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has OwnerId        => (is => 'rw', coerce => 1, isa => 'HrAssociateObj | Int ');
has VendorId       => (is => 'rw', coerce => 1, isa => 'Undef | BizBranchObj | Int ');
has DatePurchased  => (is => 'rw', coerce => 1, isa => 'Undef | DATE');
has DateSold       => (is => 'rw', coerce => 1, isa => 'Undef | DATE');
has PricePurchased => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has PriceSold      => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has SerialNo       => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has EquipmentType  => (is => 'rw', coerce => 1, isa => 'Undef | InvEquipmentTypeObj | Int ');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'EquipmentId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'PriceSold' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'decimal(12,2)'
        },
        'EquipmentType' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => 'TMS::API::Core::InvEquipmentType',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'DateSold' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'date'
        },
        'DatePurchased' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'date'
        },
        'OwnerId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'GeneralName' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'varchar(1024)'
        },
        'SerialNo' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'PricePurchased' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'decimal(12,2)'
        },
        'VendorId' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => 'TMS::API::Core::BizBranch',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

