package TMS::API::Feature::Associates::HrAssociate;
use Moose;

use TMS::API::Core::EntPerson;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::HrAssociate;

use TMS::API::Joins::Associates;

extends 'TMS::API::Feature::Features';

sub _build_coreapi  { shift->coreapi('TMS::API::Core::HrAssociate') }
sub _build_prefetch { shift->prefetch(TMS::API::Joins::Associates->new->prefetch) }

1;
