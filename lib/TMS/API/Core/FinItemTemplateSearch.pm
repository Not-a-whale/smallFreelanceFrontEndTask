package TMS::API::Core::FinItemTemplateSearch;
use Moose::Role;

has 'Name'        => ('is' => 'rw', 'isa' => 'VarChar1024', 'coerce' => '1', 'required' => '0');
has 'Deleted'     => ('is' => 'rw', 'isa' => 'BoolInt',     'coerce' => '1', 'required' => '0');
has 'UserDefined' => ('is' => 'rw', 'isa' => 'BoolInt',     'coerce' => '1', 'required' => '0');

1;
