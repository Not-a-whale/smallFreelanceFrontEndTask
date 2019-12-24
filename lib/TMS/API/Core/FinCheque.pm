package TMS::API::Core::FinCheque;

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

has 'AuthorizedBy'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'BankAccountNumber'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'BankCityAddress'    => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'BankName'           => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'BankPhone'          => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'BankRoutingNumber'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'BankStreetAddress'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'DateAuthorized'     => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DateCreated'        => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DateVoided'         => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'Memo'               => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'PayeeCityAddress'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'PayeeName'          => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'PayeePhone'         => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'PayeeStreetAddress' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'PayerCityAddress'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'PayerName'          => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'PayerPhone'         => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'PayerStreetAddress' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'VoidedBy'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

# relations
has 'bank'               => ('is' => 'rw', 'isa' => 'ObjBizBranch',            'required' => '0');
has 'transaction'        => ('is' => 'rw', 'isa' => 'ObjFinTransaction',       'required' => '0');
has 'voided_by'          => ('is' => 'rw', 'isa' => 'ObjHrAssociate',          'required' => '0');
has 'authorized_by'      => ('is' => 'rw', 'isa' => 'ObjHrAssociate',          'required' => '0');
has 'fin_cheques_prints' => ('is' => 'rw', 'isa' => 'ArrayObjFinChequesPrint', 'required' => '0');
has 'payee'              => ('is' => 'rw', 'isa' => 'ObjEntity',               'required' => '0');
has 'payer'              => ('is' => 'rw', 'isa' => 'ObjEntity',               'required' => '0');
has 'created_by'         => ('is' => 'rw', 'isa' => 'ObjHrAssociate',          'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinCheque');

1;
