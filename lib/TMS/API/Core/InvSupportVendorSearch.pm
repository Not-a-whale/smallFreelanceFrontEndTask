package TMS::API::Core::InvSupportVendorSearch;
use Moose::Role;

has 'Name'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'SupportId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'VendorId'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

1;
