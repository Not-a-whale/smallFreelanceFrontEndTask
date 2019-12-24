package TMS::API::Core::HrGovidcardStrict;
use Moose::Role;

has 'AddedBy'         => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'AstId'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'CardDateExpired' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'CardDateValid'   => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'CardNumber'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'CardSate'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'CardType'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
