package TMS::API::Core::HrGovidcardSearch;
use Moose::Role;

has 'AddedBy'         => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'AstId'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'CardDateExpired' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'CardDateValid'   => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'CardNumber'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'CardSate'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'CardType'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
