package TMS::API::Core::FinScheduledDeduction;

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

has 'Comments'         => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'CumulativeAmount' => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '1', 'default' => '0.00');
has 'DateCreated'      => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'DateStop'         => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'Period'           => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0', 'default' => 'null');
has 'PeriodDay'        => ('is' => 'rw', 'isa' => 'Int',              'coerce' => '0', 'required' => '0');
has 'SchedDeductionId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '0');
has 'ScheduleType' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1', 'default' => 'one-time charge');
has 'TotalAmount' => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0');
has 'Valid'       => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '1', 'default' => '1');

# relations
has 'entity'        => ('is' => 'rw', 'isa' => 'ObjEntity',          'coerce' => '1', 'required' => '0');
has 'created_by'    => ('is' => 'rw', 'isa' => 'ObjHrAssociate',     'coerce' => '1', 'required' => '0');
has 'item_template' => ('is' => 'rw', 'isa' => 'ObjFinItemTemplate', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinScheduledDeduction');

1;
