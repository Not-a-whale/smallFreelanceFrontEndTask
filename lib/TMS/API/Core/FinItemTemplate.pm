package TMS::API::Core::FinItemTemplate;

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
use TMS::API::Types::Columns;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'CreatedBy'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'CreditAccountId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'DateCreated'     => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'DateDeleted'     => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'DateUpdated'     => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'DebitAccountId'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'DeletedBy'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Description'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'EntityId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'ItemTemplateId'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '1', 'required' => '0');
has 'ParentId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Price'           => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '0');
has 'PriceType'       => ('is' => 'rw', 'isa' => 'enum_PriceType',   'coerce' => '1', 'required' => '0');
has 'TemplateTypeId'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'TransactionType' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'UpdatedBy'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');

# relations depends on
has 'created_by'       => ('is' => 'rw', 'isa' => 'ObjHrAssociate',          'coerce' => '1', 'required' => '0');
has 'credit_account'   => ('is' => 'rw', 'isa' => 'ObjFinAccount',           'coerce' => '1', 'required' => '0');
has 'debit_account'    => ('is' => 'rw', 'isa' => 'ObjFinAccount',           'coerce' => '1', 'required' => '0');
has 'deleted_by'       => ('is' => 'rw', 'isa' => 'ObjHrAssociate',          'coerce' => '1', 'required' => '0');
has 'entity'           => ('is' => 'rw', 'isa' => 'ObjEntity',               'coerce' => '1', 'required' => '0');
has 'parent'           => ('is' => 'rw', 'isa' => 'ObjFinItemTemplate',      'coerce' => '1', 'required' => '0');
has 'template_type'    => ('is' => 'rw', 'isa' => 'ObjFinItemTemplatesType', 'coerce' => '1', 'required' => '0');
has 'transaction_type' => ('is' => 'rw', 'isa' => 'ObjFinTransactionType',   'coerce' => '1', 'required' => '0');
has 'updated_by'       => ('is' => 'rw', 'isa' => 'ObjHrAssociate',          'coerce' => '1', 'required' => '0');

# relations point to us
has 'fin_invoices_items' => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicesItem', 'coerce' => '1', 'required' => '0');
has 'fin_item_templates' => ('is' => 'rw', 'isa' => 'ArrayObjFinItemTemplate', 'coerce' => '1', 'required' => '0');
has 'fin_item_templates_trees_ancestors' =>
    ('is' => 'rw', 'isa' => 'ArrayObjFinItemTemplatesTree', 'coerce' => '1', 'required' => '0');
has 'fin_item_templates_trees_descendants' =>
    ('is' => 'rw', 'isa' => 'ArrayObjFinItemTemplatesTree', 'coerce' => '1', 'required' => '0');
has 'fin_scheduled_deductions' => ('is' => 'rw', 'isa' => 'ArrayObjFinScheduledDeduction', 'coerce' => '1', 'required' => '0');
has 'msg_fin_item_templates'   => ('is' => 'rw', 'isa' => 'ArrayObjMsgFinItemTemplate',    'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinItemTemplate');

1;
