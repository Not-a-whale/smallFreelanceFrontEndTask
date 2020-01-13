package TMS::Test::BuildAttributes;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;

require Exporter;
our @ISA    = qw(Exporter);
our @EXPORT = qw(SetAttributes);

sub SetAttributes {
    my $attr = shift;
    my $self = shift;
    my %args = ref $_[0] ? %{$_[0]} : @_;
    foreach (keys %$attr) {
        $args{$_} = $$attr{$_} if !exists $args{$_};
    }
    return \%args;
}

1;
