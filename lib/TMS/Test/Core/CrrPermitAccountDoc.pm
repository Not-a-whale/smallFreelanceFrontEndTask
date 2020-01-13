package TMS::Test::Core::CrrPermitAccountDoc;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::GenFile;
use TMS::API::Core::CrrPermitAccount;
use TMS::API::Core::EntCarrier;
use TMS::API::Core::EntBusiness;

my $attr = {
    'crr_prmt_acc' => {
        'carrier' => {
            'carrier' => {
                'BizName' => ' ',
                'BizURL'  => ' '
            },
            'mc_certificate_photo' => {
                'FileName'      => ' ',
                'SHASIG'        => ' ',
                'DocumentTitle' => ' ',
                'UploadDate'    => ' ',
                'Notes'         => ' ',
                'Keywords'      => ' ',
                'MIMEType'      => ' ',
                'ExpiredDate'   => ' ',
                'FileData'      => ' '
            },
            'CrType'               => ' ',
            'MC'                   => ' ',
            'DOT'                  => ' ',
            'RateConfEmailAddress' => ' ',
            'SCAC'                 => ' '
        },
        'State'     => ' ',
        'AccountNo' => ' '
    },
    'crr_prmt_acc_doc' => {
        'FileName'      => ' ',
        'SHASIG'        => ' ',
        'DocumentTitle' => ' ',
        'UploadDate'    => ' ',
        'Notes'         => ' ',
        'Keywords'      => ' ',
        'MIMEType'      => ' ',
        'ExpiredDate'   => ' ',
        'FileData'      => ' '
    }
};

with 'MooseX::Traits';
extends 'TMS::API::Core::CrrPermitAccountDoc';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
