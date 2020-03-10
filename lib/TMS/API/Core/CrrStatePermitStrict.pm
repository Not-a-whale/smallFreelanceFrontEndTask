package TMS::API::Core::CrrStatePermitStrict;
use Moose::Role;

has 'Effective' => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '1');
has 'Expired'   => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '1');
has 'Issued'    => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '1');
has 'ReceiptNo' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');

1;
