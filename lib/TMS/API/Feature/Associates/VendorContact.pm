package TMS::API::Feature::Associates::VendorContact;
use Moose;

use TMS::API::Core::EntPerson;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::HrAssociate;

use TMS::API::Joins::VendorContact;

extends 'TMS::API::Feature::Features';

sub _build_coreapi  { shift->coreapi('TMS::API::Core::HrAssociate') }
sub _build_prefetch { shift->prefetch(TMS::API::Joins::VendorContact->new->prefetch) }

1;
