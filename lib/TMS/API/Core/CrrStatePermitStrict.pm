package TMS::API::Core::CrrStatePermitStrict;
use Moose::Role;

has 'CrrPrmtAccId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'Effective'    => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'Expired'      => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'Issued'       => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'ReceiptNo'    => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'VehicleId'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');

1;
