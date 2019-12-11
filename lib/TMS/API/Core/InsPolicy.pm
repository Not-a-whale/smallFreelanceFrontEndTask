package TMS::API::Core::InsPolicy;

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
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InsId             => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has ProviderAgent     => (is => 'rw', coerce => 1, isa => 'HrAssociateObj | Int ');
has ProofOfInsurance  => (is => 'rw', coerce => 1, isa => 'Undef | GenFileObj | Int ');
has TagName           => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has WhatIsInsured     => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has PolicyNumber      => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has EffectiveDate     => (is => 'rw', coerce => 1, isa => 'DATE');
has ExpirationDate    => (is => 'rw', coerce => 1, isa => 'DATE');
has InsuredAmount     => (is => 'rw', coerce => 1, isa => 'Float');
has DownpaymentAmount => (is => 'rw', coerce => 1, isa => 'Undef | Float');
has PaidBy            => (is => 'rw', coerce => 1, isa => 'Undef | EnumOwner');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'TagName' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(64)'
        },
        'ExpirationDate' => {
            'comment'  => 'Expiration Date',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'date'
        },
        'ProviderAgent' => {
            'comment'  => 'Insurance Provider Record',
            'is_null'  => 0,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'PolicyNumber' => {
            'comment'  => 'Policy Number',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'DownpaymentAmount' => {
            'is_null'  => 0,
            'comment'  => 'Downpayment Amount',
            'required' => 0,
            'apiclass' => undef,
            'default'  => '0.00',
            'db_type'  => 'decimal(12,2) unsigned'
        },
        'ProofOfInsurance' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => 'TMS::API::Core::GenFile',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'WhatIsInsured' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'PaidBy' => {
            'comment'  => 'Paid By',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'enum(\'Owner\',\'Company\')'
        },
        'InsId' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'InsuredAmount' => {
            'is_null'  => 0,
            'comment'  => 'Amount Insured',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'decimal(12,2) unsigned'
        },
        'EffectiveDate' => {
            'is_null'  => 0,
            'comment'  => 'Effective Date',
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'date'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

