package TMS::API::Core::FinItemTemplateStrict;
use Moose::Role;

has 'Name'           => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'TemplateTypeId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');

1;
