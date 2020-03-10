package TMS::Test::Core::HrHireRecord;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::GenFile;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::HrGovidcard;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::EntPerson;
use TMS::API::Core::HrAssociate;

my $attr = {
    'ast' => {
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
    'employment_authorization' => {
        'added_by' => {
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
            'AuthorityLevel' => ' ',
            'CurrentTitle'   => ' ',
            'PrimaryContact' => ' '
        },
        'ast' => {
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
        'photo' => {
            'FileName'      => ' ',
            'Notes'         => ' ',
            'Keywords'      => ' ',
            'ExpiredDate'   => ' ',
            'MIMEType'      => ' ',
            'DocumentTitle' => ' ',
            'FileData'      => ' ',
            'SHASIG'        => ' ',
            'UploadDate'    => ' '
        },
        'CardDateExpired' => ' ',
        'CardType'        => ' ',
        'CardSate'        => ' ',
        'CardNumber'      => ' ',
        'CardDateValid'   => ' '
    },
    'photo' => {
        'FileName'      => ' ',
        'Notes'         => ' ',
        'Keywords'      => ' ',
        'ExpiredDate'   => ' ',
        'MIMEType'      => ' ',
        'DocumentTitle' => ' ',
        'FileData'      => ' ',
        'SHASIG'        => ' ',
        'UploadDate'    => ' '
    },
    'StatusChangedNote' => ' ',
    'StatusChangedDate' => ' ',
    'Status'            => ' ',
    'Title'             => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::HrHireRecord';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
