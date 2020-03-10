package TMS::API::Core::InvSupportVendorSearch;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');

1;
