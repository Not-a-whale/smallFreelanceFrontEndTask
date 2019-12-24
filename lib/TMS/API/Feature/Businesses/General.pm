package TMS::API::Feature::Businesses::General;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

$Data::Dumper::Terse = 1;

use Moose;
use TMS::API::Core::EntBusiness;
extends 'TMS::API::Feature::Features';

has coreapi => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'TMS::API::Core::EntBusiness');
has prefetch => (is => 'rw', required => 0, isa => 'Undef|HashRef|ArrayRef', lazy_build => 1);

sub _build_prefetch {
    my $data = [
        {   'biz_branches' => [
                'brnch_address',
                'brnch_phone',
                'brnch_fax',
                {
                    'ent_people' => {
                        'hr_associate' => [
                                'biz_phone',
                                'biz_fax'
                            ]
                    }
                },
            ]
        },
        {   'entity' => [
                {   'fin_billing_infos' => [
                        'billing_tag',
                        'address',
                        'phone',
                        'fax',
                        {   'fin_billing_banks' => [
                                'void_check',
                                'fin_billing_rules',
                                {'institution' => [
                                        'vendor_address',
                                        'vendor_phone',
                                        'vendor_fax',
                                        'biz'
                                    ]
                                },
                            ]
                        }
                    ]
                },
                'ins_to_entities',
                'fin_tax_id',
            ]
        },
    ];
    shift->prefetch($data);
} ## end sub _build_prefetch

1;
