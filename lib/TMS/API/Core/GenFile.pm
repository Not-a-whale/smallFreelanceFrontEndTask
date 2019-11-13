package TMS::API::Core::GenFile;

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
has FileId        => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has DocumentTitle => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Keywords      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has FileName      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has FileData      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'Blob',);
has SHASIG        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'Sha256',);
has MIMEType      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has UploadDate    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has ExpiredDate   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Notes         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);

# AUTO-GENERATED HAS-A END

1;

