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
has AstId          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntPersonObj | Int ',);
has CurrentTitle   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has NodeId         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BizCompanyNodeObj | Int ',);
has AuthorityLevel => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumMember',);
has DateCreated    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has DateRemoved    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has BizPhone       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'CntPhonesfaxObj | Int ',);
has BizFax         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'CntPhonesfaxObj | Int ',);
has BizEmail       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Notes          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);

# AUTO-GENERATED HAS-A END

1;

