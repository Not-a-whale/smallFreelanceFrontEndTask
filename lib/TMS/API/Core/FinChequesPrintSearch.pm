package TMS::API::Core::FinChequesPrintSearch;
use Moose::Role;

has 'ChequeId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'PrintedBy' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
