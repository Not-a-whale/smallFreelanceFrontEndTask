package TMS::Test::Core::EntCarrier;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::GenFile;

my $attr = {
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
};

with 'MooseX::Traits';
extends 'TMS::API::Core::EntCarrier';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
