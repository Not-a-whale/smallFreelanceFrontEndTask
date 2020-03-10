package TMS::API::Core::HrGovidcardStrict;
use Moose::Role;

has 'CardDateExpired' => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '1');
has 'CardDateValid'   => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '1');
has 'CardNumber'      => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');
has 'CardSate'        => ('is' => 'rw', 'isa' => 'VarChar2',   'coerce' => '1', 'required' => '1');
has 'CardType'        => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');

1;
