package TMS::API::Core::CrrIftaSearch;
use Moose::Role;

has 'BizId'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Effective'   => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'Expiration'  => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'IFTALicense' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'McAccount'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'State'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
