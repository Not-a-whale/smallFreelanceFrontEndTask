package TMS::API::Core::HrReferenceSearch;
use Moose::Role;

has 'ReceivedDate'   => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'ReferenceNotes' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'ReferensorName' => ('is' => 'rw', 'isa' => 'VarChar255',       'coerce' => '1', 'required' => '0');

1;
