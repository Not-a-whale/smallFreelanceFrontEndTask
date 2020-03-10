package TMS::Test::Core::GenFile;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'FileName'      => ' ',
    'Notes'         => ' ',
    'FileData'      => ' ',
    'SHASIG'        => ' ',
    'UploadDate'    => ' ',
    'Keywords'      => ' ',
    'ExpiredDate'   => ' ',
    'MIMEType'      => ' ',
    'DocumentTitle' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::GenFile';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
