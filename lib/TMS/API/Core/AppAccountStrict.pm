package TMS::API::Core::AppAccountStrict;
use Moose::Role;

has 'PasswordHash' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'Salt'         => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'Username'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'Locked'       => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '1', 'default' => '0');

1;
