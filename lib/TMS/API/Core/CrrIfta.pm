package TMS::API::Core::CrrIfta;

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
use TMS::API::Core::EntBusiness;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has IftaAcctId  => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has State       => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has IFTALicense => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has McAccount   => (is => 'rw', coerce => 1, isa => 'TidySpacesString');
has ProofDoc    => (is => 'rw', coerce => 1, isa => 'Undef | GenFileObj | Int ');
has Effective   => (is => 'rw', coerce => 1, isa => 'DATE');
has Expiration  => (is => 'rw', coerce => 1, isa => 'DATE');
has BizId       => (is => 'rw', coerce => 1, isa => 'EntBusinessObj | Int ');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'McAccount' => {
            'comment'  => '',
            'is_null'  => 0,
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'Expiration' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'date'
        },
        'BizId' => {
            'comment'  => 'Who pays for it',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::EntBusiness',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'IftaAcctId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'ProofDoc' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => 'TMS::API::Core::GenFile',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'IFTALicense' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'State' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'char(2)'
        },
        'Effective' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 1,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'date'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

