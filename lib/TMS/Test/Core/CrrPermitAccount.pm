package TMS::Test::Core::CrrPermitAccount;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::EntCarrier;
use TMS::API::Core::GenFile;

my $attr = {
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
};

with 'MooseX::Traits';
extends 'TMS::API::Core::CrrPermitAccount';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
