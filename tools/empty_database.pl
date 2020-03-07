#!/usr/bin/env perl
BEGIN { push @INC, '/usko/web/sites/uskofms.latest/libs' }

use strict;
use warnings FATAL => 'all';
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;
use Carp;
use ClassDBI;

$Data::Dumper::Terse = 1;

if (!defined $ARGV[0]) {
    print "$0 <db host name>\n";
    exit 0;
}

my $skp = {
    fin_billing_tags          => 1,
    fin_account_types         => 1,
    fin_account_types_trees   => 1,
    fin_accounts              => 1,
    fin_accounts_trees        => 1,
    fin_transaction_types     => 1,
    sft_vehicle_inspect_items => 1,
};

print "\nI'll delete everything from TMS database on host $ARGV[0] accept apps_*\nand these tables:\n".
Dumper([ keys %$skp]);

print "\nAre you sure you want to do it?\n";
print "Press ENTER to do it, or Ctrl+C to cancel ";
<STDIN>;

my $h = ClassDBI->new(
    host          => $ARGV[0],
    user          => 'root',
    password      => 'Nlvae4asd!',
    database      => 'tms',
    fetchsth_name => 0
);

my @tbs = grep { !exists $$skp{$_} && $_ !~ /^app_/ } $h->tables;

for (1 .. 5) {
    foreach my $tbl (@tbs) {
        my $data = $h->do("SELECT COUNT(*) AS 'count' FROM $tbl");
        if ($$data[0]{count} > 0) {
            print "Table: $tbl";
            print " $$data[0]{count}\n";
            $h->do("DELETE IGNORE FROM $tbl");
        }
    }
}

print "=" x 120 . "\n";
foreach my $tbl ($h->tables) {
    my $data = ($h->do("SELECT COUNT(*) AS 'count' FROM $tbl"))->[0];
    printf "%40s %d\n", $tbl, $$data{count};
}
