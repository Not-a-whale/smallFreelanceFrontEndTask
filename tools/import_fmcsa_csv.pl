#!/usr/bin/env perl
# END { print "\nAll done. Press ENTER to exit. "; <STDIN>; }

BEGIN {
    use Cwd 'abs_path';
    use File::Basename;
    unshift @INC, abs_path(dirname(abs_path($0)) . "/../lib");
}

use strict;
use feature 'say';
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Text::CSV qw( csv );
use Devel::Confess;
use Data::Dumper;
use Getopt::Std;
use Try::Tiny;
use IO::All;
use JSON;

use TMS::API::Feature::FMCSA;

$Data::Dumper::Terse = 1;

my %cli;
getopts('c:j:', \%cli);

my $data = undef;
if (exists $cli{c} && -f $cli{c}) {
    $data = csv(in => $cli{c}, headers => "auto");
} elsif (exists $cli{j} && -f $cli{j}) {
    my $json = io($cli{j})->slurp;
    $data = JSON->new->decode($json);
} else {
    print <<EOH;
JSON or CSV file is required from

Compressed CSV file can be found at
https://ai.fmcsa.dot.gov/SMS/files/FMCSA_CENSUS1_2020Apr.zip

Downloads page:
https://ai.fmcsa.dot.gov/SMS/Tools/Downloads.aspx

Usage:
$0 <options>

    Options:
        -j <JSON file>
        or
        -c <CSV file>
EOH
    exit;
}

foreach (@$data) {
    say "=" x 120;
    say Dumper($_);
    my $physical = {
        OfficeName    => $$_{LEGAL_NAME} . " - physical",
        BrnchEMail    => $$_{EMAIL_ADDRESS},
        brnch_address => {
            Street1  => $$_{PHY_STREET},
            City     => $$_{PHY_CITY},
            State    => $$_{PHY_STATE},
            Zip      => $$_{PHY_ZIP},
            Country  => $$_{PHY_COUNTRY},
            AddrType => 'physical',
        }
    };
    delete $$physical{BrnchEMail} unless $$physical{BrnchEMail} =~ /\S+/;

    my $mailing = {
        OfficeName    => $$_{LEGAL_NAME} . " - mail",
        BrnchEMail    => $$_{EMAIL_ADDRESS},
        brnch_fax     => {Number => $$_{FAX}},
        brnch_phone   => {Number => $$_{TELEPHONE}},
        brnch_address => {
            Street1  => $$_{MAILING_STREET},
            City     => $$_{MAILING_CITY},
            State    => $$_{MAILING_STATE},
            Zip      => $$_{MAILING_ZIP},
            Country  => $$_{MAILING_COUNTRY},
            AddrType => 'mail',
        }
    };
    delete $$mailing{BrnchEMail} unless $$mailing{BrnchEMail} =~ /\S+/;

    $$_{DBA_NAME} = $$_{LEGAL_NAME} if $$_{DBA_NAME} !~ /\w+/;

    if ($$_{FAX} =~ /\d/) {
        $$mailing{brnch_fax}{Number}  = $$_{FAX};
        $$physical{brnch_fax}{Number} = $$_{FAX};
    }

    if ($$_{TELEPHONE} =~ /\d/) {
        $$mailing{brnch_fax}{Number}  = $$_{TELEPHONE};
        $$physical{brnch_fax}{Number} = $$_{TELEPHONE};
    }

    my $rec = {
        DOT          => $$_{DOT_NUMBER},
        AddedToFMCSA => $$_{ADD_DATE},
        OIC_STATE    => $$_{OIC_STATE},
        carrier      => {
            BizName      => $$_{LEGAL_NAME},
            DBA          => $$_{DBA_NAME},
            biz_branches => [$physical, $mailing],
        },
        crr_statistics => [
            {   "HmFlag" => $$_{HM_FLAG} eq 'N' ? 0 : 1,
                "PcFlag" => $$_{PC_FLAG} eq 'N' ? 0 : 1,
                "MCS150FormDate"        => $$_{MCS150_DATE},
                "MCS150FormMileage"     => $$_{MCS150_MILEAGE} || 0,
                "MCS150FormMileageYear" => $$_{MCS150_MILEAGE_YEAR} || 0,
                "EmployedDriversCDL"    => $$_{DRIVER_TOTAL} || 0,
                "UnitsOperated"         => $$_{NBR_POWER_UNIT} || 0,
            }
        ]
    };
    my $error = TMS::API::Feature::FMCSA->new()->Create({POST => $rec});
    say Dumper($error);
}

