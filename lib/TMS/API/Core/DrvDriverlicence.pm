package TMS::API::Core::DrvDriverlicence;

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
use TMS::API::Core::DrvDriver;
use TMS::API::Core::CntState;
use TMS::API::Core::DrvCdlEndorsement;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has DrLcId          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has DriverId        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DrvDriverObj',);
has DrLicNumber     => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has DrLcDateValid   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);
has DrLcDateExpired => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);
has DrLcSate        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'CntStateObj',);
has DrLcEndorsement => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DrvCdlEndorsementObj',);
has Photo           => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'GenFileObj',);

# AUTO-GENERATED HAS-A END

1;

