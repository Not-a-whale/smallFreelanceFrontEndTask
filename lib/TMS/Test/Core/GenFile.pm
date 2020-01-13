package TMS::Test::Core::GenFile;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'FileName'      => ' ',
    'ExpiredDate'   => ' ',
    'DocumentTitle' => ' ',
    'SHASIG'        => ' ',
    'Notes'         => ' ',
    'UploadDate'    => ' ',
    'Keywords'      => ' ',
    'FileData'      => ' ',
    'MIMEType'      => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::GenFile';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
