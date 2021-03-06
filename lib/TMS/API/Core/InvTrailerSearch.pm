package TMS::API::Core::InvTrailerSearch;
use Moose::Role;

has 'HasLiftGate'   => ('is' => 'rw', 'isa' => 'BoolInt',   'coerce' => '1', 'required' => '0');
has 'HasPalletJack' => ('is' => 'rw', 'isa' => 'BoolInt',   'coerce' => '1', 'required' => '0');
has 'HasRamps'      => ('is' => 'rw', 'isa' => 'BoolInt',   'coerce' => '1', 'required' => '0');
has 'HazMat'        => ('is' => 'rw', 'isa' => 'BoolInt',   'coerce' => '1', 'required' => '0');
has 'Type'          => ('is' => 'rw', 'isa' => 'VarChar24', 'coerce' => '1', 'required' => '0');

1;
