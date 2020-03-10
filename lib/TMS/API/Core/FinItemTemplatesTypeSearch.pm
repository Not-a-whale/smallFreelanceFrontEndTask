package TMS::API::Core::FinItemTemplatesTypeSearch;
use Moose::Role;

has 'Description'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Name'          => ('is' => 'rw', 'isa' => 'VarChar1024',      'coerce' => '1', 'required' => '0');
has 'DisplayToUser' => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '0');
has 'UserDefined'   => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '0');

1;
