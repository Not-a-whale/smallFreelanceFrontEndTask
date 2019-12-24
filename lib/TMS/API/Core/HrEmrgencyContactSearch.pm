package TMS::API::Core::HrEmrgencyContactSearch;
use Moose::Role;

has 'AstId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'ContactName'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'ContactPhone' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Effective'    => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'Expired'      => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'Relationship' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
