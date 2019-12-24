package TMS::API::Core::AppAccountLock;

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

has 'DateLastAttempt' => ('is' => 'rw', 'isa' => 'DATETIME', 'required' => '0');
has 'Locked'          => ('is' => 'rw', 'isa' => 'BoolInt',  'required' => '1', 'default' => '0');
has 'LoginAttempts'   => ('is' => 'rw', 'isa' => 'Int',      'required' => '1', 'default' => '0');

# relations
has 'app_account' => ('is' => 'rw', 'isa' => 'ObjAppAccount', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'AppAccountLock');

1;
