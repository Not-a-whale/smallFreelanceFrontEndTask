package TMS::API::Core::FinItemTemplatesType;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

$Data::Dumper::Terse = 1;

use Moose;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Complex;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'DisplayToUser'  => ('is' => 'rw', 'isa' => 'BoolInt',       'required' => '1', 'default' => '1');
has 'TemplateTypeId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'UserDefined'    => ('is' => 'rw', 'isa' => 'BoolInt',       'required' => '1', 'default' => '1');

# relations
has 'fin_item_templates' => ('is' => 'rw', 'isa' => 'ArrayObjFinItemTemplate', 'required' => '0');

has '_dbix_class' =>
    (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinItemTemplatesType');

1;
