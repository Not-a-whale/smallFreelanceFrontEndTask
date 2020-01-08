package TMS::API::Joins::InvEquipment;
use Moose;
use TMS::API::Joins::OwnerContact;
use TMS::API::Joins::VendorBranch;

extends 'TMS::API::Joins::Prefetch';

sub _build_prefetch {
    shift->prefetch(
        [
            TMS::API::Joins::VendorBranch->new->joins('vendor'),
            TMS::API::Joins::OwnerContact->new->joins('owner'),
            'equipment_type'
        ]
    );
}

1;
