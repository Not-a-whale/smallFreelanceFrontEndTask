package TMS::API::Feature::OfficeBranches::BizBranch;
use Moose;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntAddress;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::HrAssociate;
use TMS::API::Joins::OfficeBranch;
extends 'TMS::API::Feature::Features';

sub _build_coreapi  { shift->coreapi('TMS::API::Core::BizBranch') }
sub _build_prefetch { shift->prefetch(TMS::API::Joins::OfficeBranch->new->prefetch) }

1;
