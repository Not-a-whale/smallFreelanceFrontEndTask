package TMS::API::Feature::Carriers::EntCarrier;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use Moose;
extends 'TMS::API::Core::EntCarrier';

has prefetch => (is => 'rw', isa => 'HashRef', lazy_build => 1);

sub _build_prefetch {
    my $self = shift;
    my $data = {
        prefetch => [
            {   'carrier' => [
                    {   'biz_branches' => [
                            'brnch_address', 'brnch_phone', 'brnch_fax',
                            {'ent_people' => {'hr_associate' => ['biz_phone', 'biz_fax']}},
                        ]
                    },
                    {   'entity' => [
                            {   'fin_billing_infos' => [
                                    'billing_tag',
                                    'address',
                                    'phone', 'fax',
                                    {   'fin_billing_banks' =>
                                            [
                                                'void_check',
                                                'fin_billing_rules',
                                                { 'institution' => [
                                                    'vendor_address', 'vendor_phone', 'vendor_fax', 'biz'
                                                ] },
                                            ]
                                    }
                                ]
                            },
                            'fin_tax_id',
                        ]
                    },
                    'crr_iftas',
                ],
            },
            'crr_permit_accounts',
        ]
    };
    $self->prefetch($data);
} ## end sub _build_prefetch

1;

