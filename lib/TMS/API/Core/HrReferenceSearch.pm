package TMS::API::Core::HrReferenceSearch;
use Moose::Role;

has 'ReceivedBy'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'ReceivedDate'    => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'ReferenceFor'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'ReferenceNotes'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'ReferensorName'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'ReferensorPhone' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');

1;
