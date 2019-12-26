package TMS::API::Core::FinAccountSearch;
use Moose::Role;

has 'AccountTypeId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Name'          => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Active'        => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '0');
has 'Balance'       => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '0');
has 'UserDefined'   => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '0');
has 'Valid'         => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '0');

1;
