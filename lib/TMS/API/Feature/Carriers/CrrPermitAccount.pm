package TMS::API::Feature::Carriers::CrrPermitAccount;
use Moose;
use TMS::API::Core::CrrPermitAccount;
use TMS::API::Joins::CrrPermitAccount;
extends 'TMS::API::Feature::Features';

sub _build_coreapi  { shift->coreapi('TMS::API::Core::CrrPermitAccount') }
sub _build_prefetch { shift->prefetch(TMS::API::Joins::CrrPermitAccount->new->prefetch) }
