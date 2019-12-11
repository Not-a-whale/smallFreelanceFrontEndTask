package TMS::API::Core::HrHireRecord;

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
use TMS::API::Core::HrGovidcard;
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
has HireId                  => (is => 'rw', coerce => 0, isa => 'Undef | PrimaryKeyInt');
has AstId                   => (is => 'rw', coerce => 1, isa => 'HrAssociateObj | Int ');
has Title                   => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has StatusChangedDate       => (is => 'rw', coerce => 1, isa => 'Undef | DATE');
has StatusChangedNote       => (is => 'rw', coerce => 1, isa => 'Undef | TidySpacesString');
has Status                  => (is => 'rw', coerce => 1, isa => 'Undef | EnumActive');
has Photo                   => (is => 'rw', coerce => 1, isa => 'Undef | GenFileObj | Int ');
has EmploymentAuthorization => (is => 'rw', coerce => 1, isa => 'HrGovidcardObj | Int ');

has AllErrors => (is => 'rw', isa => 'ArrayRef',    default    => sub { [] });
has LastError => (is => 'rw', isa => 'Undef | Str', default    => undef);
has TableMeta => (is => 'rw', isa => 'HashRef',     lazy_build => 1);
has DoIfError => (is => 'rw', isa => 'Str',         default    => 'confess');    # confess or ignore

sub _build_TableMeta {
    my $self = shift;
    my $data = {
        'EmploymentAuthorization' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => 'TMS::API::Core::HrGovidcard',
            'required' => 1,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Status' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => 'active',
            'db_type'  => 'enum(\'active\',\'terminated\',\'leave of absence\',\'suspended\')'
        },
        'AstId' => {
            'comment'  => '',
            'is_null'  => 0,
            'required' => 1,
            'apiclass' => 'TMS::API::Core::HrAssociate',
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'HireId' => {
            'is_null'  => 0,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'Title' => {
            'is_null'  => 1,
            'comment'  => '',
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(255)'
        },
        'StatusChangedNote' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => undef,
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'varchar(1024)'
        },
        'Photo' => {
            'comment'  => '',
            'is_null'  => 1,
            'apiclass' => 'TMS::API::Core::GenFile',
            'required' => 0,
            'default'  => undef,
            'db_type'  => 'bigint(20) unsigned'
        },
        'StatusChangedDate' => {
            'comment'  => '',
            'is_null'  => 1,
            'required' => 0,
            'apiclass' => undef,
            'default'  => undef,
            'db_type'  => 'date'
        }
    };
    $self->TableMeta($data);
} ## end sub _build_TableMeta

# AUTO-GENERATED HAS-A END

1;

