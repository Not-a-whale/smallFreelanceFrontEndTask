package TMS::API::Core::Entity;

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

has 'BusinessId'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'DateCreated' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'EntityId'    => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'IsActive'    => ('is' => 'rw', 'isa' => 'BoolInt',          'required' => '1', 'default' => '1');
has 'Notes'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'PersonId'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

# relations
has 'fin_item_templates'       => ('is' => 'rw', 'isa' => 'ArrayObjFinItemTemplate',       'required' => '0');
has 'fin_journal_entries'      => ('is' => 'rw', 'isa' => 'ArrayObjFinJournalEntry',       'required' => '0');
has 'fin_billing_infos'        => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingInfo',        'required' => '0');
has 'fin_cheques_payers'       => ('is' => 'rw', 'isa' => 'ArrayObjFinCheque',             'required' => '0');
has 'person'                   => ('is' => 'rw', 'isa' => 'ObjEntPerson',                  'required' => '0');
has 'business'                 => ('is' => 'rw', 'isa' => 'ObjEntBusiness',                'required' => '0');
has 'fin_tax_id'               => ('is' => 'rw', 'isa' => 'ObjFinTaxId',                   'required' => '0');
has 'fin_invoices'             => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoice',            'required' => '0');
has 'ent_blacklists'           => ('is' => 'rw', 'isa' => 'ArrayObjEntBlacklist',          'required' => '0');
has 'ins_to_entities'          => ('is' => 'rw', 'isa' => 'ArrayObjInsToEntity',           'required' => '0');
has 'fin_cheques_payees'       => ('is' => 'rw', 'isa' => 'ArrayObjFinCheque',             'required' => '0');
has 'fin_invoice_payments'     => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicePayment',     'required' => '0');
has 'fin_scheduled_deductions' => ('is' => 'rw', 'isa' => 'ArrayObjFinScheduledDeduction', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'Entity');

1;
