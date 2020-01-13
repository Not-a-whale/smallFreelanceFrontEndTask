package TMS::API::Joins::CrrIfta;
use Moose;
extends 'TMS::API::Joins::Prefetch';

sub _build_prefetch {
    shift->prefetch(
        [
            'biz_ifta',
            'proof_doc'
        ]
    );
}
1;
