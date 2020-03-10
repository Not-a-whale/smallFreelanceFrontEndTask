package TMS::API::Core::HrReferenceStrict;
use Moose::Role;

has 'ReceivedDate'   => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '1');
has 'ReferenceNotes' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'ReferensorName' => ('is' => 'rw', 'isa' => 'VarChar255',       'coerce' => '1', 'required' => '1');

1;
