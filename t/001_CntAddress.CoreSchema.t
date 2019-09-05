BEGIN {
    use Cwd 'abs_path';
    use File::Basename;
    unshift @INC, abs_path(dirname(abs_path($0)) . '/../lib');
}

use strict;
use warnings FATAL => 'all';
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;
use Test::More;

use TMS::API::Types::Columns;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::Test::Core::CntAddress;

$TMS::API::Types::Columns::AUTO_GENERATE = 1;
$TMS::API::Types::Simple::AUTO_GENERATE  = 1;
$TMS::API::Types::Objects::AUTO_GENERATE = 1;

my $TheDefault = {
    'Notes'   => ' ',
    'Street2' => ' ',
    'Zip'     => ' ',
    'Street1' => ' ',
    'AddrId'  => undef,
    'State'   => ' ',
    'GpsLat'  => ' ',
    'Country' => ' ',
    'Street3' => ' ',
    'GpsLng'  => ' ',
    'City'    => ' '
};

my $Obj = TMS::Test::Core::CntAddress->new(%$TheDefault);
$Obj->SchemaWrapperAll;
done_testing();
