package TMS::API::Core::EntBlacklistStrict;
use Moose::Role;

has 'DateCreated' => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '1');
has 'Reason'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'Type'        => ('is' => 'rw', 'isa' => 'enum_Type',        'coerce' => '1', 'required' => '1', 'default' => 'private');

1;
