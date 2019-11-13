package TMS::Test::Core::CntAddress;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use Moose;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::API::Core::CntAddress';
with 'TMS::Test::DataGen';
with 'TMS::Test::Cases::SchemaWrapper';
with 'TMS::Test::Cases::BasicDataManip';
with 'TMS::Test::Suites::SchemaWrapper';
with 'TMS::Test::Suites::BasicDataManip';

# override types here
# has '+COLNAME' => (is => 'rw', coerce => 1, required => REQUIRED, isa => Undef | 'TYPE',);
# has '+COLNAME' => (init_arg => undef, builder => '_build_undef' );
# sub _build_undef { shift->COLNAME(undef) };

1;
