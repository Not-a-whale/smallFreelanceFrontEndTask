package TMS::API::Core::CntAddressStrict;
use Moose::Role;

has 'City'    => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'State'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'Street1' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'Zip'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
