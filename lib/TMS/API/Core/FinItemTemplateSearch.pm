package TMS::API::Core::FinItemTemplateSearch;
use Moose::Role;

has 'Name'           => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'TemplateTypeId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

1;
