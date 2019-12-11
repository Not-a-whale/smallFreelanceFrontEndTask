package TMS::API::Core::HrAssociate;

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
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::BizCompanyNode;
use TMS::API::Core::EntPerson;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has AstId          => (is => 'rw', coerce => 1, isa => 'EntPersonObj | Int ');
has CurrentTitle   => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has NodeId         => (is => 'rw', coerce => 1, isa => 'Undef | BizCompanyNodeObj | Int ');
has AuthorityLevel => (is => 'rw', coerce => 1, isa => 'Undef | EnumMember');
has DateCreated    => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has DateRemoved    => (is => 'rw', coerce => 1, isa => 'Undef | DATETIME');
has BizPhone       => (is => 'rw', coerce => 1, isa => 'Undef | CntPhonesfaxObj | Int ');
has BizFax         => (is => 'rw', coerce => 1, isa => 'Undef | CntPhonesfaxObj | Int ');
has BizEmail       => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Notes          => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'BizPhone' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::CntPhonesfax',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'BizEmail' => {
            'is_null'  => 1,
            'comment'  => '',
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'DateRemoved' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'datetime'
        },
        'CurrentTitle' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'BizFax' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::CntPhonesfax',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'AstId' => {
            'is_null'  => 0,
            'comment'  => '',
            'required' => 0,
            'apiclass' => 'TMS::API::Core::EntPerson',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'AuthorityLevel' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'member',
            'db_type'  => 'enum(\'member\',\'vise\',\'executive\')'
        },
        'Notes' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'text'
        },
        'DateCreated' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'CURRENT_TIMESTAMP',
            'db_type'  => 'datetime'
        },
        'NodeId' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => 'TMS::API::Core::BizCompanyNode',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

