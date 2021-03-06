package TMS::Test::Core::DrvDriverlicence;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::GenFile;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::DrvCdlEndorsement;
use TMS::API::Core::DrvDriver;
use TMS::API::Core::CntAddress;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::BizBranch;
use TMS::API::Core::EntPerson;
use TMS::API::Core::EntBusiness;

my $attr = {
    'dr_lc_endorsement' => {
        'ValidFromDate' => ' ',
        'ExpiredDate'   => ' ',
        'Endorsement'   => ' '
    },
    'driver' => {
        'driver' => {
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
        'LastAnnualReview'    => ' ',
        'InternationalRoutes' => ' ',
        'LocalRoutes'         => ' ',
        'PullNotice'          => ' '
    },
    'photo' => {
        'FileName'      => ' ',
        'Notes'         => ' ',
        'FileData'      => ' ',
        'SHASIG'        => ' ',
        'UploadDate'    => ' ',
        'Keywords'      => ' ',
        'ExpiredDate'   => ' ',
        'MIMEType'      => ' ',
        'DocumentTitle' => ' '
    },
    'DrLicNumber'     => ' ',
    'DrLcDateExpired' => ' ',
    'DrLcSate'        => ' ',
    'DrLcDateValid'   => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::DrvDriverlicence';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
