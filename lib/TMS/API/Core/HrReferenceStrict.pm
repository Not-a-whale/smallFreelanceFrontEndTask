package TMS::API::Core::HrReferenceStrict;
use Moose::Role;

has 'ReceivedBy'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'ReceivedDate'    => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'ReferenceFor'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'ReferenceNotes'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'ReferensorName'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'ReferensorPhone' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');

1;
