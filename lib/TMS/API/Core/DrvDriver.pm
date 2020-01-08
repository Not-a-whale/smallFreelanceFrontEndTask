package TMS::API::Core::DrvDriver;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

$Data::Dumper::Terse = 1;

use Moose;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Complex;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'LastAnnualReview' => ('is' => 'rw', 'isa' => 'DATETIME', 'coerce' => '1', 'required' => '0');
has 'PullNotice'       => ('is' => 'rw', 'isa' => 'DATETIME', 'coerce' => '1', 'required' => '0');

# relations
has 'driver'              => ('is' => 'rw', 'isa' => 'ObjHrAssociate',           'coerce' => '1', 'required' => '0');
has 'drv_driverlicences'  => ('is' => 'rw', 'isa' => 'ArrayObjDrvDriverlicence', 'coerce' => '1', 'required' => '0');
has 'drv_medcards'        => ('is' => 'rw', 'isa' => 'ArrayObjDrvMedcard',       'coerce' => '1', 'required' => '0');
has 'drv_schedules'       => ('is' => 'rw', 'isa' => 'ArrayObjDrvSchedule',      'coerce' => '1', 'required' => '0');
has 'dsp_loads_trackings' => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsTracking', 'coerce' => '1', 'required' => '0');
has 'sft_log_entries'     => ('is' => 'rw', 'isa' => 'ArrayObjSftLogEntry',      'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'DrvDriver');

1;
