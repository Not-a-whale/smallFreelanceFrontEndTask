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

has 'BusinessId'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'DateCreated' => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'EntityId'    => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '0');
has 'IsActive'    => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '1', 'default' => '1');
has 'Notes'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'PersonId'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');

# relations
has 'fin_invoice_payments'     => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicePayment',     'coerce' => '1', 'required' => '0');
has 'business'                 => ('is' => 'rw', 'isa' => 'ObjEntBusiness',                'coerce' => '1', 'required' => '0');
has 'fin_tax_id'               => ('is' => 'rw', 'isa' => 'ObjFinTaxId',                   'coerce' => '1', 'required' => '0');
has 'ins_to_entities'          => ('is' => 'rw', 'isa' => 'ArrayObjInsToEntity',           'coerce' => '1', 'required' => '0');
has 'fin_cheques_payees'       => ('is' => 'rw', 'isa' => 'ArrayObjFinCheque',             'coerce' => '1', 'required' => '0');
has 'fin_journal_entries'      => ('is' => 'rw', 'isa' => 'ArrayObjFinJournalEntry',       'coerce' => '1', 'required' => '0');
has 'fin_item_templates'       => ('is' => 'rw', 'isa' => 'ArrayObjFinItemTemplate',       'coerce' => '1', 'required' => '0');
has 'fin_scheduled_deductions' => ('is' => 'rw', 'isa' => 'ArrayObjFinScheduledDeduction', 'coerce' => '1', 'required' => '0');
has 'person'                   => ('is' => 'rw', 'isa' => 'ObjEntPerson',                  'coerce' => '1', 'required' => '0');
has 'fin_invoices'             => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoice',            'coerce' => '1', 'required' => '0');
has 'fin_billing_infos'        => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingInfo',        'coerce' => '1', 'required' => '0');
has 'ent_blacklists'           => ('is' => 'rw', 'isa' => 'ArrayObjEntBlacklist',          'coerce' => '1', 'required' => '0');
has 'fin_cheques_payers'       => ('is' => 'rw', 'isa' => 'ArrayObjFinCheque',             'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'Entity');

1;
