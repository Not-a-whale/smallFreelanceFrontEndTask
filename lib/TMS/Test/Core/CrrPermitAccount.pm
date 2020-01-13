package TMS::Test::Core::CrrPermitAccount;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::GenFile;
use TMS::API::Core::EntCarrier;
use TMS::API::Core::EntBusiness;

my $attr = {
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
};

with 'MooseX::Traits';
extends 'TMS::API::Core::CrrPermitAccount';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
