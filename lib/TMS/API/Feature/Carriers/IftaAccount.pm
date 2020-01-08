package TMS::API::Feature::Carriers::IftaAccount;
use Moose;
use TMS::API::Core::CrrIfta;
use TMS::API::Core::EntBusiness;
use TMS::API::Joins::CrrIfta;
extends 'TMS::API::Feature::Features';

sub _build_coreapi  { shift->coreapi('TMS::API::Core::CrrIfta') }
sub _build_prefetch { shift->prefetch(TMS::API::Joins::CrrIfta->new->prefetch) }
