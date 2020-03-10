package TMS::API::Core::FinItemTemplateStrict;
use Moose::Role;

has 'Name'        => ('is' => 'rw', 'isa' => 'VarChar1024', 'coerce' => '1', 'required' => '1');
has 'Deleted'     => ('is' => 'rw', 'isa' => 'BoolInt',     'coerce' => '1', 'required' => '1', 'default' => '0');
has 'UserDefined' => ('is' => 'rw', 'isa' => 'BoolInt',     'coerce' => '1', 'required' => '1', 'default' => '1');

1;
