package TMS::Test::Core::DspLoad;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::InvTrailerType;
use TMS::API::Core::EntCustomer;
use TMS::API::Core::CntAddress;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::FinJob;
use TMS::API::Core::BizBranch;
use TMS::API::Core::EntShipper;
use TMS::API::Core::EntPerson;
use TMS::API::Core::EntBusiness;

my $attr = {
    'booked_by' => {
        'ast' => {
            'brnch' => {
                'biz' => {
                    'BizName' => ' ',
                    'BizURL'  => ' '
                },
                'brnch_address' => {
                    'GpsLat'  => ' ',
                    'Notes'   => ' ',
                    'Street2' => ' ',
                    'GpsLng'  => ' ',
                    'City'    => ' ',
                    'Street1' => ' ',
                    'State'   => ' ',
                    'Country' => ' ',
                    'Street3' => ' ',
                    'Zip'     => ' '
                },
                'brnch_fax' => {
                    'Notes'     => ' ',
                    'Extension' => ' ',
                    'Number'    => ' ',
                    'Features'  => ' ',
                    'Mobility'  => ' '
                },
                'brnch_phone' => {
                    'Notes'     => ' ',
                    'Extension' => ' ',
                    'Number'    => ' ',
                    'Features'  => ' ',
                    'Mobility'  => ' '
                },
                'OfficeName' => ' ',
                'BrnchEMail' => ' '
            },
            'MiddleName' => ' ',
            'Prefix'     => ' ',
            'NickName'   => ' ',
            'LastName'   => ' ',
            'FirstName'  => ' ',
            'Suffix'     => ' '
        },
        'biz_fax' => {
            'Notes'     => ' ',
            'Extension' => ' ',
            'Number'    => ' ',
            'Features'  => ' ',
            'Mobility'  => ' '
        },
        'biz_phone' => {
            'Notes'     => ' ',
            'Extension' => ' ',
            'Number'    => ' ',
            'Features'  => ' ',
            'Mobility'  => ' '
        },
        'Notes'          => ' ',
        'BizEmail'       => ' ',
        'DateCreated'    => ' ',
        'DateRemoved'    => ' ',
        'CurrentTitle'   => ' ',
        'AuthorityLevel' => ' ',
        'PrimaryContact' => ' '
    },
    'broker' => {
        'cstmr' => {
            'BizURL'  => ' ',
            'BizName' => ' '
        },
        'DOT'              => ' ',
        'DontUse'          => ' ',
        'MC'               => ' ',
        'Factoring'        => ' ',
        'Terms'            => ' ',
        'Bond'             => ' ',
        'SCAC'             => ' ',
        'WhyDontUse'       => ' ',
        'DUNS'             => ' ',
        'CreditLimit'      => ' ',
        'RequireOriginals' => ' '
    },
    'created_by' => {
        'ast' => {
            'brnch' => {
                'biz' => {
                    'BizURL'  => ' ',
                    'BizName' => ' '
                },
                'brnch_address' => {
                    'GpsLat'  => ' ',
                    'Notes'   => ' ',
                    'Street2' => ' ',
                    'GpsLng'  => ' ',
                    'City'    => ' ',
                    'Street1' => ' ',
                    'State'   => ' ',
                    'Country' => ' ',
                    'Street3' => ' ',
                    'Zip'     => ' '
                },
                'brnch_fax' => {
                    'Notes'     => ' ',
                    'Extension' => ' ',
                    'Number'    => ' ',
                    'Features'  => ' ',
                    'Mobility'  => ' '
                },
                'brnch_phone' => {
                    'Notes'     => ' ',
                    'Extension' => ' ',
                    'Number'    => ' ',
                    'Features'  => ' ',
                    'Mobility'  => ' '
                },
                'OfficeName' => ' ',
                'BrnchEMail' => ' '
            },
            'MiddleName' => ' ',
            'Prefix'     => ' ',
            'NickName'   => ' ',
            'LastName'   => ' ',
            'FirstName'  => ' ',
            'Suffix'     => ' '
        },
        'biz_fax' => {
            'Notes'     => ' ',
            'Extension' => ' ',
            'Number'    => ' ',
            'Features'  => ' ',
            'Mobility'  => ' '
        },
        'biz_phone' => {
            'Notes'     => ' ',
            'Extension' => ' ',
            'Number'    => ' ',
            'Features'  => ' ',
            'Mobility'  => ' '
        },
        'Notes'          => ' ',
        'BizEmail'       => ' ',
        'DateCreated'    => ' ',
        'DateRemoved'    => ' ',
        'CurrentTitle'   => ' ',
        'AuthorityLevel' => ' ',
        'PrimaryContact' => ' '
    },
    'job' => {
        'JobAddedBy' => ' ',
        'JobCreated' => ' ',
        'Title'      => ' '
    },
    'shipper' => {
        'shipper' => {
            'BizURL'  => ' ',
            'BizName' => ' '
        },
        'Notes' => ' '
    },
    'truck_type'     => {},
    'GoogleRoute'    => ' ',
    'ReeferTempLow'  => ' ',
    'DateCreated'    => ' ',
    'TempMode'       => ' ',
    'DispatchNote'   => ' ',
    'Precooling'     => ' ',
    'ReeferTempHigh' => ' ',
    'LoadNumber'     => ' ',
    'LoadType'       => ' ',
    'Status'         => ' ',
    'DateBooked'     => ' ',
    'ProNumber'      => ' ',
    'LoadRate'       => ' ',
    'TeamRequired'   => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::DspLoad';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
