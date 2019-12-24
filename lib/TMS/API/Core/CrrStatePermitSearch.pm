package TMS::API::Core::CrrStatePermitSearch;
use Moose::Role;

has 'CrrPrmtAccId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Effective'    => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'Expired'      => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'Issued'       => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'ReceiptNo'    => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'VehicleId'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

1;
