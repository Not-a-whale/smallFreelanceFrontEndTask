package TMS::API::Core::AppAccountLoginSearch;
use Moose::Role;

has 'IPAddress' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'Type'      => ('is' => 'rw', 'isa' => 'enum_Type',   'coerce' => '1', 'required' => '0');

1;
