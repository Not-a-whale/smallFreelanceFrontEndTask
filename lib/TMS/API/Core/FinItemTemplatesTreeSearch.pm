package TMS::API::Core::FinItemTemplatesTreeSearch;
use Moose::Role;

has 'AncestorId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'DescendantId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

1;
