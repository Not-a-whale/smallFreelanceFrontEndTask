package TMS::Test::Core::GenFile;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'FileName'      => ' ',
    'SHASIG'        => ' ',
    'DocumentTitle' => ' ',
    'UploadDate'    => ' ',
    'Notes'         => ' ',
    'Keywords'      => ' ',
    'MIMEType'      => ' ',
    'ExpiredDate'   => ' ',
    'FileData'      => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::GenFile';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
