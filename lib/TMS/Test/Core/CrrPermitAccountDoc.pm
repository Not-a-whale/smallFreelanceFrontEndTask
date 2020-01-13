package TMS::Test::Core::CrrPermitAccountDoc;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::EntCarrier;
use TMS::API::Core::CrrPermitAccount;
use TMS::API::Core::GenFile;

my $attr = {
    'crr_prmt_acc' => {
        'carrier' => {
            'carrier' => {
                'BizURL'  => ' ',
                'BizName' => ' '
            },
            'mc_certificate_photo' => {
                'FileName'      => ' ',
                'ExpiredDate'   => ' ',
                'DocumentTitle' => ' ',
                'SHASIG'        => ' ',
                'Notes'         => ' ',
                'UploadDate'    => ' ',
                'Keywords'      => ' ',
                'FileData'      => ' ',
                'MIMEType'      => ' '
            },
            'CrType'               => ' ',
            'DOT'                  => ' ',
            'RateConfEmailAddress' => ' ',
            'SCAC'                 => ' ',
            'MC'                   => ' '
        },
        'State'     => ' ',
        'AccountNo' => ' '
    },
    'crr_prmt_acc_doc' => {
        'FileName'      => ' ',
        'ExpiredDate'   => ' ',
        'DocumentTitle' => ' ',
        'SHASIG'        => ' ',
        'Notes'         => ' ',
        'UploadDate'    => ' ',
        'Keywords'      => ' ',
        'FileData'      => ' ',
        'MIMEType'      => ' '
    }
};

with 'MooseX::Traits';
extends 'TMS::API::Core::CrrPermitAccountDoc';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
