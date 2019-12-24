package TMS::API::Core::DrvCdlEndorsementSearch;
use Moose::Role;

has 'Endorsement'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'ExpiredDate'   => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'ValidFromDate' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');

1;
