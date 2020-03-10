package TMS::API::Core::CntAddressSearch;
use Moose::Role;

has 'City'    => ('is' => 'rw', 'isa' => 'City',                 'coerce' => '1', 'required' => '0');
has 'State'   => ('is' => 'rw', 'isa' => 'SupportedStateAbbr',   'coerce' => '1', 'required' => '0');
has 'Street1' => ('is' => 'rw', 'isa' => 'Street',               'coerce' => '1', 'required' => '0');
has 'Zip'     => ('is' => 'rw', 'isa' => 'ZipCanadaUSA',         'coerce' => '1', 'required' => '0');
has 'Country' => ('is' => 'rw', 'isa' => 'SupportedCountryName', 'coerce' => '1', 'required' => '0');
has 'Street2' => ('is' => 'rw', 'isa' => 'StreetOrEmpty',        'coerce' => '1', 'required' => '0');
has 'Street3' => ('is' => 'rw', 'isa' => 'StreetOrEmpty',        'coerce' => '1', 'required' => '0');

1;
