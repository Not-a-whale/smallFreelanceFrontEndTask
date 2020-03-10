package TMS::API::Core::SftElogStatSearch;
use Moose::Role;

has 'Latitude'           => ('is' => 'rw', 'isa' => 'Float',       'coerce' => '1', 'required' => '0');
has 'LocationProviderId' => ('is' => 'rw', 'isa' => 'VarChar1024', 'coerce' => '1', 'required' => '0');
has 'Longitude'          => ('is' => 'rw', 'isa' => 'Float',       'coerce' => '1', 'required' => '0');

1;
