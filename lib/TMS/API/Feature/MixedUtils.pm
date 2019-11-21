package TMS::API::Feature::MixedUtils;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(Sift);

sub Sift {
    $DB::single = 2;
    my ($post, $meta) = @_;
    foreach my $cl (keys %$post) {
        if (!exists $$meta{$cl}) {
            delete $$post{$cl};
            next;
        }
        Sift($$post{$cl}, $$meta{$cl}{tree}) if exists $$meta{$cl}{tree} && scalar(%{$$meta{$cl}{tree}}) > 0;
    }
    return $post;
}

1;
