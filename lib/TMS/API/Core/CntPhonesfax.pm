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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'Extension' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1', 'default' => '0');
has 'Features'  => ('is' => 'rw', 'isa' => 'Any',              'required' => '1', 'default' => 'VOICE');
has 'Mobility'  => ('is' => 'rw', 'isa' => 'Any',              'required' => '1', 'default' => 'LAND LINE');
has 'Notes'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'PhnFaxId'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');

# relations
has 'hr_references'             => ('is' => 'rw', 'isa' => 'ArrayObjHrReference',       'required' => '0');
has 'biz_branches_brnch_phones' => ('is' => 'rw', 'isa' => 'ArrayObjBizBranch',         'required' => '0');
has 'biz_branches_brnch_faxes'  => ('is' => 'rw', 'isa' => 'ArrayObjBizBranch',         'required' => '0');
has 'hr_associates_biz_faxes'   => ('is' => 'rw', 'isa' => 'ArrayObjHrAssociate',       'required' => '0');
has 'fin_billing_infos_faxes'   => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingInfo',    'required' => '0');
has 'fin_billing_infos_phones'  => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingInfo',    'required' => '0');
has 'hr_associates_biz_phones'  => ('is' => 'rw', 'isa' => 'ArrayObjHrAssociate',       'required' => '0');
has 'hr_confidentials'          => ('is' => 'rw', 'isa' => 'ArrayObjHrConfidential',    'required' => '0');
has 'hr_residences'             => ('is' => 'rw', 'isa' => 'ArrayObjHrResidence',       'required' => '0');
has 'hr_emrgency_contacts'      => ('is' => 'rw', 'isa' => 'ArrayObjHrEmrgencyContact', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'CntPhonesfax');

1;
