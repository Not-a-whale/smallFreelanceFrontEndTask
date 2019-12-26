package TMS::API::Core::FinItemTemplateStrict;
use Moose::Role;

has 'Name'           => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'TemplateTypeId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');

1;
