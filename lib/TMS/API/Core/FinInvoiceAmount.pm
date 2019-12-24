package TMS::API::Core::FinInvoiceAmount;

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

has 'Amount'   => ('is' => 'rw', 'isa' => 'CurrencyValue',    'required' => '0');
has 'Comments' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'DateCreated' => ('is' => 'rw', 'isa' => 'DATETIME', 'required' => '1', 'default' => '0000-00-00 00:00:00');
has 'DateInvoiced'   => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'FactoredParent' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Notes'          => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'PONumber'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'RefNumber'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Status'         => ('is' => 'rw', 'isa' => 'Any',              'required' => '1', 'default' => 'pending');

has '_dbix_class' =>
    (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinInvoiceAmount');

1;
