package TMS::API::Core::HrGovidcardSearch;
use Moose::Role;

has 'CardDateExpired' => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '0');
has 'CardDateValid'   => ('is' => 'rw', 'isa' => 'DATETIME',   'coerce' => '1', 'required' => '0');
has 'CardNumber'      => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');
has 'CardSate'        => ('is' => 'rw', 'isa' => 'VarChar2',   'coerce' => '1', 'required' => '0');
has 'CardType'        => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');

1;
