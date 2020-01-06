package TMS::API::Joins::OfficeBranchPeople;
use Moose;
use TMS::API::Joins::OfficeBranch;
extends 'TMS::API::Joins::Prefetch';

sub _build_prefetch {
    shift->prefetch(
        [
            @{TMS::API::Joins::OfficeBranch->new->prefetch},
            {
                'ent_people' => {
                    'hr_associate' => [
                        'biz_phone',
                        'biz_fax'
                    ]
                }
            },
        ]
    );
}
1;
