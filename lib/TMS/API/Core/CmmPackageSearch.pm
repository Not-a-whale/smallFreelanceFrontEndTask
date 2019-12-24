package TMS::API::Core::CmmPackageSearch;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

1;
