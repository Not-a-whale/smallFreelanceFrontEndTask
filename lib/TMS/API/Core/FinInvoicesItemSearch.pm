package TMS::API::Core::FinInvoicesItemSearch;
use Moose::Role;

has 'JobId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
