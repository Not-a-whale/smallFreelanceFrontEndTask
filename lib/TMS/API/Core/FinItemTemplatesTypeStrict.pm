package TMS::API::Core::FinItemTemplatesTypeStrict;
use Moose::Role;

has 'Description'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'Name'          => ('is' => 'rw', 'isa' => 'VarChar1024',      'coerce' => '1', 'required' => '1');
has 'DisplayToUser' => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '1', 'default' => '1');
has 'UserDefined'   => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '1', 'default' => '1');

1;
