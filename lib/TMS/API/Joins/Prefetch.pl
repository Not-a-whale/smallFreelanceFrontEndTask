#!/usr/bin/env perl
BEGIN {
    use Cwd 'abs_path';
    use File::Basename;
    my $cur = abs_path(dirname(abs_path($0)));
    (my $lib = $cur) =~ s/\/lib\/.*/\/lib/;
    push @INC, ($cur, $lib);
}

use strict;
use warnings FATAL => 'all';
use Devel::Confess;
use Data::Dumper;

$Data::Dumper::Terse = 1;

my $filename = $ARGV[0];
if (!defined $filename || !-f "$filename") {
    print "Library filename is required\nSyntax:\n\t$0 <file.pm>\n";
    exit 1;
}

my $content = `cat "$filename"`;
my $package = ($content =~ /^package (\S+);/m)[0];

require "$filename";
my $obj = $package->new;
print Dumper($obj->prefetch);
