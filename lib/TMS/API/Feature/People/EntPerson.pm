package TMS::API::Feature::People::EntPerson;

use Moose;

use TMS::API::Core::EntPerson;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntBusiness;

use TMS::API::Joins::Person;

extends 'TMS::API::Feature::Features';

sub _build_coreapi  { shift->coreapi('TMS::API::Core::EntPerson') }
sub _build_prefetch { shift->prefetch(TMS::API::Joins::Person->new->prefetch) }

1;
