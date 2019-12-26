package TMS::API::Core::HrEmrgencyContactStrict;
use Moose::Role;

has 'AstId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'ContactName'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'ContactPhone' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'Effective'    => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '1');
has 'Expired'      => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '1');
has 'Relationship' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
