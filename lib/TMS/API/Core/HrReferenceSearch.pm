package TMS::API::Core::HrReferenceSearch;
use Moose::Role;

has 'ReceivedBy'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'ReceivedDate'    => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'ReferenceFor'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'ReferenceNotes'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'ReferensorName'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'ReferensorPhone' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

1;
