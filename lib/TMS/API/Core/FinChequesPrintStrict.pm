package TMS::API::Core::FinChequesPrintStrict;
use Moose::Role;

has 'ChequeId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'PrintedBy' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
