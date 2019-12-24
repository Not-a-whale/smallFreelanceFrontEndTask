package TMS::API::Core::DrvCdlEndorsementStrict;
use Moose::Role;

has 'Endorsement'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'ExpiredDate'   => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'ValidFromDate' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');

1;
