package TMS::API::Core::CrrStatePermitSearch;
use Moose::Role;

has 'Effective' => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '0');
has 'Expired'   => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '0');
has 'Issued'    => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '0');
has 'ReceiptNo' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');

1;
