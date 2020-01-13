package TMS::Test::Core::EntOwnerOperator;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::EntCarrier;
use TMS::API::Core::GenFile;

my $attr = {
    'biz' => {
        'BizURL'  => ' ',
        'BizName' => ' '
    },
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
    }
};

with 'MooseX::Traits';
extends 'TMS::API::Core::EntOwnerOperator';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
