package TMS::API::Core::FinInvoicesItemStrict;
use Moose::Role;

has 'JobId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
