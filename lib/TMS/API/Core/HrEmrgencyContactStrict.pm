package TMS::API::Core::HrEmrgencyContactStrict;
use Moose::Role;

has 'AstId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'ContactName'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'ContactPhone' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'Effective'    => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'Expired'      => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'Relationship' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
