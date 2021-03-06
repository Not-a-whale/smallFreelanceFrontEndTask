package TMS::API::Core::InvTrailerStrict;
use Moose::Role;

has 'HasLiftGate'   => ('is' => 'rw', 'isa' => 'BoolInt',   'coerce' => '1', 'required' => '1', 'default' => '0');
has 'HasPalletJack' => ('is' => 'rw', 'isa' => 'BoolInt',   'coerce' => '1', 'required' => '1', 'default' => '0');
has 'HasRamps'      => ('is' => 'rw', 'isa' => 'BoolInt',   'coerce' => '1', 'required' => '1', 'default' => '0');
has 'HazMat'        => ('is' => 'rw', 'isa' => 'BoolInt',   'coerce' => '1', 'required' => '1', 'default' => '0');
has 'Type'          => ('is' => 'rw', 'isa' => 'VarChar24', 'coerce' => '1', 'required' => '0', 'default' => 'Van');

1;
