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
        'SHASIG'        => ' ',
        'DocumentTitle' => ' ',
        'UploadDate'    => ' ',
        'Notes'         => ' ',
        'Keywords'      => ' ',
        'MIMEType'      => ' ',
        'ExpiredDate'   => ' ',
        'FileData'      => ' '
    },
    'Effective'   => ' ',
    'Expiration'  => ' ',
    'State'       => ' ',
    'IFTALicense' => ' ',
    'McAccount'   => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::CrrIfta';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
