package TMS::Test::Core::CrrPermitAccountDoc;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::EntCarrier;
use TMS::API::Core::GenFile;
use TMS::API::Core::CrrPermitAccount;
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
                'Notes'         => ' ',
                'FileData'      => ' ',
                'SHASIG'        => ' ',
                'UploadDate'    => ' ',
                'Keywords'      => ' ',
                'ExpiredDate'   => ' ',
                'MIMEType'      => ' ',
                'DocumentTitle' => ' '
            },
            'DOT'                  => ' ',
            'RateConfEmailAddress' => ' ',
            'MC'                   => ' ',
            'CrType'               => ' ',
            'SCAC'                 => ' '
        },
        'State'     => ' ',
        'AccountNo' => ' '
    },
    'crr_prmt_acc_doc' => {
        'FileName'      => ' ',
        'Notes'         => ' ',
        'FileData'      => ' ',
        'SHASIG'        => ' ',
        'UploadDate'    => ' ',
        'Keywords'      => ' ',
        'ExpiredDate'   => ' ',
        'MIMEType'      => ' ',
        'DocumentTitle' => ' '
    }
};

with 'MooseX::Traits';
extends 'TMS::API::Core::CrrPermitAccountDoc';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
