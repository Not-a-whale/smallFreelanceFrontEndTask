package TMS::API::Core::InvSupportVendorStrict;
use Moose::Role;

has 'Name'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'SupportId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '1');
has 'VendorId'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');

1;
