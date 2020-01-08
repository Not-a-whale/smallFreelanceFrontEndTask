package TMS::API::Joins::CrrIftaDecal;
use Moose;
use TMS::API::Joins::CrrIfta;
extends 'TMS::API::Joins::Prefetch';

sub _build_prefetch {
    shift->prefetch(
        [
            TMS::API::Joins::CrrIfta->new->joins('ifta_acct'),
            'decal_img'
        ]
    );
}
1;
