package TMS::API::Feature::Businesses::General;
use Moose;
use TMS::API::Core::EntBusiness;
use TMS::API::Joins::VendorBranch;
use TMS::API::Joins::EntityBilling;

extends 'TMS::API::Feature::Features';

sub _build_coreapi { shift->coreapi('TMS::API::Core::EntBusiness') }

sub _build_prefetch {
    shift->prefetch(
        [
            TMS::API::Joins::VendorBranch->new->joins('biz_branches', 'hasmany'),
            TMS::API::Joins::EntityBilling->new->joins('biz_branches', 'hasmany'),
        ]
    );
}

#sub _build_prefetch {
#    shift->prefetch(
#        [
#            {   'biz_branches' => [
#                    'brnch_address',
#                    'brnch_phone',
#                    'brnch_fax',
#                    {
#                        'ent_people' => {
#                            'hr_associate' => [
#                                    'biz_phone',
#                                    'biz_fax'
#                                ]
#                        }
#                    },
#                ]
#            },
#            {   'entity' => [
#                    {   'fin_billing_infos' => [
#                            'billing_tag',
#                            'address',
#                            'phone',
#                            'fax',
#                            {   'fin_billing_banks' => [
#                                    'void_check',
#                                    'fin_billing_rules',
#                                    {'institution' => [
#                                            'vendor_address',
#                                            'vendor_phone',
#                                            'vendor_fax',
#                                            'biz'
#                                        ]
#                                    },
#                                ]
#                            }
#                        ]
#                    },
#                    'ins_to_entities',
#                    'fin_tax_id',
#                ]
#            },
#        ]
#    )
#}

1;
