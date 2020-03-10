package TMS::API::Core::CntAddressStrict;
use Moose::Role;

has 'City'    => ('is' => 'rw', 'isa' => 'City',               'coerce' => '1', 'required' => '1');
has 'State'   => ('is' => 'rw', 'isa' => 'SupportedStateAbbr', 'coerce' => '1', 'required' => '1');
has 'Street1' => ('is' => 'rw', 'isa' => 'Street',             'coerce' => '1', 'required' => '1');
has 'Zip'     => ('is' => 'rw', 'isa' => 'ZipCanadaUSA',       'coerce' => '1', 'required' => '1');
has 'Country' =>
    ('is' => 'rw', 'isa' => 'SupportedCountryName', 'coerce' => '1', 'required' => '1', 'default' => 'United States');
has 'Street2' => ('is' => 'rw', 'isa' => 'StreetOrEmpty', 'coerce' => '1', 'required' => '1', 'default' => '');
has 'Street3' => ('is' => 'rw', 'isa' => 'StreetOrEmpty', 'coerce' => '1', 'required' => '1', 'default' => '');

1;
