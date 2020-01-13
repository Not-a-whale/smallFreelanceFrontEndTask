package TMS::Test::Core::EntCarrier;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::GenFile;
use TMS::API::Core::EntBusiness;

my $attr = {
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
};

with 'MooseX::Traits';
extends 'TMS::API::Core::EntCarrier';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
