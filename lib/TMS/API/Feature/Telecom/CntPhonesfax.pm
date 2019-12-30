package TMS::API::Feature::Telecom::CntPhonesfax;
use Moose;
use TMS::API::Core::CntPhonesfax;
extends 'TMS::API::Feature::Features';

sub _build_coreapi  { shift->coreapi('TMS::API::Core::CntPhonesfax') }
sub _build_prefetch { shift->prefetch(undef) }

1;
