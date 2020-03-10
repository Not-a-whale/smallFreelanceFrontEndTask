package TMS::Test::Core::CrrIfta;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::GenFile;
use TMS::API::Core::EntBusiness;

my $attr = {
    'biz' => {
        'BizName' => ' ',
        'BizURL'  => ' '
    },
    'proof_doc' => {
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
    'IFTALicense' => ' ',
    'Effective'   => ' ',
    'State'       => ' ',
    'McAccount'   => ' ',
    'Expiration'  => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::CrrIfta';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
