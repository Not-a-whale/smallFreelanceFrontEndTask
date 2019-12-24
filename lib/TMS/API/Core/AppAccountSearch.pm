package TMS::API::Core::AppAccountSearch;
use Moose::Role;

has 'PasswordHash' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Salt'         => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'UserId'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Username'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
