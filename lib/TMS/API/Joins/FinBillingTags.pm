package TMS::API::Joins::FinBillingTags;
use Moose;
extends 'TMS::API::Joins::Prefetch';
sub _build_prefetch { shift->prefetch(undef) }
1;
