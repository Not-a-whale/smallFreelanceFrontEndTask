package TMS::API::Core::CrrIftaStrict;
use Moose::Role;

has 'BizId'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'Effective'   => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'Expiration'  => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'IFTALicense' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'McAccount'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'State'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
