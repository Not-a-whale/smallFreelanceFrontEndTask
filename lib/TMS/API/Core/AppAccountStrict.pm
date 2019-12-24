package TMS::API::Core::AppAccountStrict;
use Moose::Role;

has 'PasswordHash' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'Salt'         => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'UserId'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'Username'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
