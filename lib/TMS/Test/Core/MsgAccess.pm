package TMS::Test::Core::MsgAccess;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {'PermissionName' => ' '};

with 'MooseX::Traits';
extends 'TMS::API::Core::MsgAccess';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
