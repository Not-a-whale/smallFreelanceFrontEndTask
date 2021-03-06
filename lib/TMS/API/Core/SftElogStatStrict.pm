package TMS::API::Core::SftElogStatStrict;
use Moose::Role;

has 'Latitude'           => ('is' => 'rw', 'isa' => 'Float',       'coerce' => '1', 'required' => '1');
has 'LocationProviderId' => ('is' => 'rw', 'isa' => 'VarChar1024', 'coerce' => '1', 'required' => '1');
has 'Longitude'          => ('is' => 'rw', 'isa' => 'Float',       'coerce' => '1', 'required' => '1');

1;
