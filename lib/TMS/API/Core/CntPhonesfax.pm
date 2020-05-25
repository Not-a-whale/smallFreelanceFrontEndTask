package TMS::API::Core::CntPhonesfax;

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

has 'Notes'         => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'PhnFaxId'      => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '1', 'required' => '0');
has 'TimeZone'      => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '0');
has 'WorkHrsClosed' => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');
has 'WorkHrsOpen'   => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');

# relations point to us
has 'biz_branches_brnch_faxes'  => ('is' => 'rw', 'isa' => 'ArrayObjBizBranch',         'coerce' => '1', 'required' => '0');
has 'biz_branches_brnch_phones' => ('is' => 'rw', 'isa' => 'ArrayObjBizBranch',         'coerce' => '1', 'required' => '0');
has 'biz_company_nodes'         => ('is' => 'rw', 'isa' => 'ArrayObjBizCompanyNode',    'coerce' => '1', 'required' => '0');
has 'fin_billing_infos_faxes'   => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingInfo',    'coerce' => '1', 'required' => '0');
has 'fin_billing_infos_phones'  => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingInfo',    'coerce' => '1', 'required' => '0');
has 'hr_associates_biz_faxes'   => ('is' => 'rw', 'isa' => 'ArrayObjHrAssociate',       'coerce' => '1', 'required' => '0');
has 'hr_associates_biz_phones'  => ('is' => 'rw', 'isa' => 'ArrayObjHrAssociate',       'coerce' => '1', 'required' => '0');
has 'hr_confidentials'          => ('is' => 'rw', 'isa' => 'ArrayObjHrConfidential',    'coerce' => '1', 'required' => '0');
has 'hr_emrgency_contacts'      => ('is' => 'rw', 'isa' => 'ArrayObjHrEmrgencyContact', 'coerce' => '1', 'required' => '0');
has 'hr_references'             => ('is' => 'rw', 'isa' => 'ArrayObjHrReference',       'coerce' => '1', 'required' => '0');
has 'hr_residences'             => ('is' => 'rw', 'isa' => 'ArrayObjHrResidence',       'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'CntPhonesfax');

1;
