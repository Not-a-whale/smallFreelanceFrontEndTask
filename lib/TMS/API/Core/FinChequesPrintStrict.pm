package TMS::API::Core::FinChequesPrintStrict;
use Moose::Role;

has 'ChequeId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'PrintedBy' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
