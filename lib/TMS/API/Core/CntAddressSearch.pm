package TMS::API::Core::CntAddressSearch;
use Moose::Role;

has 'City'    => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'State'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Street1' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Zip'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
