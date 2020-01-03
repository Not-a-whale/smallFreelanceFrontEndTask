package TMS::API::Feature::Telecom::CntPhonesfax;
use Moose;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Joins::PhonesFaxes;
extends 'TMS::API::Feature::Features';

sub _build_coreapi  { shift->coreapi('TMS::API::Core::CntPhonesfax') }
sub _build_prefetch { shift->prefetch(TMS::API::Joins::PhonesFaxes->new->prefetch) }

1;
