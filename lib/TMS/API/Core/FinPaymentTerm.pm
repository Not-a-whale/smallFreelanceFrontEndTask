package TMS::API::Core::FinPaymentTerm;

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

has 'DiscountAmount'  => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0');
has 'DiscountInDays'  => ('is' => 'rw', 'isa' => 'Int',           'coerce' => '0', 'required' => '0');
has 'DiscountPercent' => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0');
has 'DueInDays'       => ('is' => 'rw', 'isa' => 'Int',           'coerce' => '0', 'required' => '0');
has 'DueNext'         => ('is' => 'rw', 'isa' => 'Int',           'coerce' => '0', 'required' => '0');
has 'PaymentTermId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

# relations
has 'fin_invoices' => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoice', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinPaymentTerm');

1;
