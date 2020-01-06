package TMS::API::Feature::Billing::EntityBilling;

use Moose;

use TMS::API::Core::FinBillingInfo;
use TMS::API::Core::FinTaxId;
use TMS::API::Core::EntPerson;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::EntPerson;

use TMS::API::Core::Entity;
use TMS::API::Joins::EntityBilling;

extends 'TMS::API::Feature::Features';

sub _build_coreapi  { shift->coreapi('TMS::API::Core::Entity') }
sub _build_prefetch { shift->prefetch(TMS::API::Joins::EntityBilling->new->prefetch) }

1;
