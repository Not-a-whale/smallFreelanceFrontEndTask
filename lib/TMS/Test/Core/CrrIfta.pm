package TMS::Test::Core::CrrIfta;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::GenFile;

my $attr = {
    'biz' => {
        'BizURL'  => ' ',
        'BizName' => ' '
    },
    'proof_doc' => {
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
    'State'       => ' ',
    'IFTALicense' => ' ',
    'McAccount'   => ' ',
    'Expiration'  => ' ',
    'Effective'   => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::CrrIfta';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
