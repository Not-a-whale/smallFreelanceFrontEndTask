package TMS::API::Types::Simple;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Date::Manip;
use Digest::SHA qw(sha256_hex);

use Moose::Util::TypeConstraints;
use MooseX::Types::Moose qw(Int Str);

my $DateObj = new Date::Manip::Date;

my $UsState_Abbr2Name = {
    "AL" => "Alabama",
    "AK" => "Alaska",
    "AZ" => "Arizona",
    "AR" => "Arkansas",
    "CA" => "California",
    "CO" => "Colorado",
    "CT" => "Connecticut",
    "DE" => "Delaware",
    "FL" => "Florida",
    "GA" => "Georgia",
    "HI" => "Hawaii",
    "ID" => "Idaho",
    "IL" => "Illinois",
    "IN" => "Indiana",
    "IA" => "Iowa",
    "KS" => "Kansas",
    "KY" => "Kentucky",
    "LA" => "Louisiana",
    "ME" => "Maine",
    "MD" => "Maryland",
    "MA" => "Massachusetts",
    "MI" => "Michigan",
    "MN" => "Minnesota",
    "MS" => "Mississippi",
    "MO" => "Missouri",
    "MT" => "Montana",
    "NE" => "Nebraska",
    "NV" => "Nevada",
    "NH" => "New Hampshire",
    "NJ" => "New Jersey",
    "NM" => "New Mexico",
    "NY" => "New York",
    "NC" => "North Carolina",
    "ND" => "North Dakota",
    "OH" => "Ohio",
    "OK" => "Oklahoma",
    "OR" => "Oregon",
    "PA" => "Pennsylvania",
    "RI" => "Rhode Island",
    "SC" => "South Carolina",
    "SD" => "South Dakota",
    "TN" => "Tennessee",
    "TX" => "Texas",
    "UT" => "Utah",
    "VT" => "Vermont",
    "VA" => "Virginia",
    "WA" => "Washington",
    "WV" => "West Virginia",
    "WI" => "Wisconsin",
    "WY" => "Wyoming",
};

my $UsState_Abbr2NameUC = { map { $_ , uc($$UsState_Abbr2Name{$_})} keys %$UsState_Abbr2Name};
my $UsState_Name2Abbr = {map { $$UsState_Abbr2Name{$_}, $_ } keys %$UsState_Abbr2Name};
my $UsState_Name2AbbrUC = {map { uc($$UsState_Abbr2Name{$_}), $_ } keys %$UsState_Abbr2Name};

my $CanadaState_Abbr2Name = {
    "AB" => "Alberta",
    "BC" => "British Columbia",
    "MB" => "Manitoba",
    "NB" => "New Brunswick",
    "NL" => "Newfoundland and Labrador",
    "NT" => "Northwest Territories",
    "NS" => "Nova Scotia",
    "NU" => "Nunavut",
    "ON" => "Ontario",
    "PE" => "Prince Edward Island",
    "QC" => "Quebec",
    "SK" => "Saskatchewan",
    "YT" => "Yukon",
};

my $CanadaState_Abbr2NameUC = {map { $_ , uc($$CanadaState_Abbr2Name{$_}) } keys %$CanadaState_Abbr2Name};
my $CanadaState_Name2Abbr = {map { $$CanadaState_Abbr2Name{$_}, $_ } keys %$CanadaState_Abbr2Name};
my $CanadaState_Name2AbbrUC = {map { uc($$CanadaState_Abbr2Name{$_}), $_ } keys %$CanadaState_Abbr2Name};

# ............................................................................
subtype 'TidySpacesString',
    as 'Str',
        where { /^\S+$|^(\S+\s)+\S+$/ };

coerce 'TidySpacesString',
    from 'Str',
        via {
            s/^\s+|\s+$//g;
            s/\s+/ /g;
            return $_;
        };

# ............................................................................
subtype 'UpperCaseStr',
    as 'Str',
        where { /^(?:([A-Z]*)\s*)+$/ };

coerce 'UpperCaseStr',
    from 'Str',
        via {
            s/^\s+|\s+$//g;
            s/\s+/ /g;
            s/(\w+)/uc($1)/ge;
            return $_;
        };
# ............................................................................
subtype 'NameCapitalized',
    as 'Str',
        where { /^(?:([A-Z][a-z\.]*)\s*)+$/ };

coerce 'NameCapitalized',
    from 'Str',
        via {
            s/^\s+|\s+$//g;
            s/\s+/ /g;
            s/(\w+)/ucfirst(lc($1))/ge;
            return $_;
        };

# ............................................................................
subtype 'PrimaryKeyInt',
    as 'Int',
        where {
            return 1 if !defined $_;
            return $_ >= 0;
        },
        message { "Int is not larger than 0" };

coerce 'PrimaryKeyInt',
    from 'Int',
        via { abs($_) },
    from 'Str',
        via {
            s/\D+//;
            return undef if !/\d+/;
            return $_;
        };

# ............................................................................
subtype 'PositiveInt',
    as 'Int',
        where { $_ >= 0 },
        message { "Int is not larger than 0" };

coerce 'PositiveInt',
    from 'Int',
        via { abs($_) },
    from 'Str',
        via { $_ =~ s/\D+// };

# ............................................................................
subtype 'UserNameLowerCase',
    as 'Str',
        where {/^[a-z][a-z0-9_]{2,15}$/},
        message {
            "User Name must be from 2 to 15 characters long and contain"
            . " only 'a-z0-9_' characters. You have '$_'"
        };

coerce 'UserNameLowerCase',
    from 'Str',
        via {
            s/[^a-z0-9_].*//gi;
            lc($_);
        };

# ............................................................................
subtype 'EnumYesNo',
    as 'Str',
        where {/^(yes|no)$/};

coerce 'EnumYesNo',
    from 'Str',
        via {
            s/\s//g;
            s/.*(yes|no).*/$1/i;
            lc($_);
        };

# ............................................................................
subtype 'CronTabTime',
    as 'Str',
        where {/^([0-9,\-\/\*]+\s){4}[0-7,\-\/\*]+$/};

coerce 'CronTabTime',
    from 'Str',
        via {
            s/^\s+//;
            s/\s+$//;
        };
# ............................................................................
subtype 'Sha256Password',
    as 'Str',
        where { /[0-9a-f]{64}/i },
        message {
            "$_! A password mas be at least 6 characters long and contain at"
                . " least one UPERCASE letter, at least one lower case"
                . " letter and at least one number"
        };

coerce 'Sha256Password',
    from 'Str',
        via {
            return 'Short Password' if !/.{6,}/;
            return 'Missing digits' if !/[0-9]/;
            return 'No upper case'  if !/[A-Z]/;
            return 'No lower case'  if !/[a-z]/;
            sha256_hex($_);
        };

# ............................................................................
subtype 'DATETIME',
    as 'Str',
        where {
            if( /^(\d{4})-(\d\d)-(\d\d) (\d\d):(\d\d):(\d\d)$/ ) {
                my @max = (undef,31,29,31,30,31,30,31,31,30,31,30,31);
                return undef if $1 < 1900 && $1 > 2100;
                return undef if $2 < 1 && $2 > 12;
                return undef if $3 < 1 && $3 > $max[$2];
                return undef if $4 < 0 && $4 > 23;
                return undef if $5 < 0 && $5 > 59;
                return undef if $6 < 0 && $6 > 59;
                return 1;
            }
            return undef;
        },
        message { "Unable to parse \"$_\" into '%Y-%m-%d %H:%M:%S'" };

coerce 'DATETIME',
    from 'Str',
        via {
            return undef if $DateObj->parse($_);
            return $DateObj->printf('%Y-%m-%d %H:%M:%S');
        };

# ............................................................................
subtype 'DbDuration', as 'PositiveInt';

coerce 'DbDuration',
    from 'Str',
        via {
            my $delta    = 1;
            my $duration = 0;
            $duration += (/(\d+)\s*m/i ? $1 : 0) * ($delta *= 60); # (1M) minutes
            $duration += (/(\d+)\s*h/i ? $1 : 0) * ($delta *= 60); # (1H) hours
            $duration += (/(\d+)\s*d/i ? $1 : 0) * ($delta *= 24); # (1D) days
            $duration += (/(\d+)\s*b/i ? $1 : 0) * ($delta *= 8);  # (1B) 8 hrs business day
            $duration += (/(\d+)\s*l/i ? $1 : 0) * ($delta *= 8);  # (1L) 12 hrs long business day
            $duration += (/(\d+)\s*w/i ? $1 : 0) * ($delta *= 7);  # (1W) weeks
            $duration += (/(\d+)\s*r/i ? $1 : 0) * ($delta *= 5);  # (1R) 5 days woRk weeks
            return $duration;
        };
# ............................................................................
subtype 'CurrencyValue',
    as 'Str',
        where {/^(?:\-)?\d+(?:\.\d+)$/};

coerce 'CurrencyValue',
    from 'Str',
        via {
            $_ =~ s/[^\d\.\-\(\)]//g;

            my $isnegative = ( $_ =~ m/-(.*)/ ) ? 1 : 0;
            my $value = ( $isnegative ? $1 : undef )
            || $_;    #because perl reuses $1 for regex and subroutine names

            $isnegative = ( $_ =~ m/\((.*)\)/ ) ? 1 : 0 || $isnegative;
            $value = ( $isnegative ? $1 : undef )
            || $value;    #because perl reuses $1 for regex and subroutine names

            my $sign = $isnegative ? '-' : '';
            $value =~ m/(\d*(?:\.\d*)?)/;
            my $number = $1 || 0;

            return sprintf( '%s%0.2f', ( $sign, $number ) );
        };

# ............................................................................
subtype 'PhoneExt',
    as 'Str',
        where {
            /^[0-9\#\*,]{1,}$/;
        };

coerce 'PhoneExt',
    from 'Str',
        via {
            s/[^0-9\#\*,]//gs;
            return $_;
        };

# ............................................................................
subtype 'PhoneNumber',
    as 'Str',
        where {
            /^\d{3}\-\d{3}\-\d{4}$/;
        },
        message {
            "Phone Number must be in format 000-000-0000. You have '$_'"
        };

coerce 'PhoneNumber',
    from 'Str',
        via {
            s/\D+//g;
            s/.*?(\d{3})(\d{3})(\d{4})$/$1\-$2\-$3/;
            return $_;
        };

# ............................................................................
subtype 'VIN',
    as 'Str',
        where {
            return undef if (length $_ != 17);
            return undef if (substr($_, 8 , 1) !~ /\d/);
            my $map = '0123456789X';
            my $weights = '8765432X098765432';
            my $translit = '0123456789.ABCDEFGH..JKLMN.P.R..STUVWXYZ';
            my $sum = 0;
            foreach my $i (0 .. length $_){

                $sum += index ( $translit, substr( $_, $i, 1) ) % 10 * index ( $map , substr( $weights, $i, 1));
            }
            return substr($map, $sum % 11, 1) == substr($_, 8, 1);

        },
        message {
            "The VIN you provided is invalid format. Please check and try again."
        };

# ............................................................................
subtype 'Float',
    as 'Str',
    where {
        /\d+|\.\d+|\d+(?:\.\d+)?/;
    };

coerce 'Float',
    from 'Str',
        via {
            s/[^\d\.]//g;
            return $_;
        };
# ............................................................................
subtype 'SupportedStateName',
    as 'Str',
        where {
            exists $$UsState_Name2Abbr{$_} || exists $$CanadaState_Name2Abbr{$_};
        };

coerce 'SupportedStateName',
    from 'Str',
        via {
            my $state = uc($_);
            $state =~ s/^\s+//;
            $state =~ s/\s+$//;
            $state =~ s/\s+/ /g;

            if (exists $$UsState_Name2AbbrUC{$state}) {
                return $$UsState_Abbr2Name{$$UsState_Name2AbbrUC{$state}};
            }
            if (exists $$CanadaState_Name2AbbrUC{$state}) {
                return $$CanadaState_Abbr2Name{$$CanadaState_Name2AbbrUC{$state}};
            }

            return $$CanadaState_Abbr2Name{$state} if exists $$CanadaState_Abbr2Name{$state};
            return $$UsState_Abbr2Name{$state}     if exists $$UsState_Abbr2Name{$state};
        };

# ............................................................................
subtype 'SupportedStateAbbr',
    as 'Str',
        where {
            exists $$UsState_Abbr2Name{$_} || exists $$CanadaState_Abbr2Name{$_};
        };

coerce 'SupportedStateAbbr',
    from 'Str',
        via {
            my $state = uc($_);
            $state =~ s/^\s+//;
            $state =~ s/\s+$//;
            $state =~ s/\s+/ /g;

            return $state if exists $$UsState_Abbr2NameUC{$state} || exists $$CanadaState_Abbr2NameUC{$_};
            return $$CanadaState_Name2AbbrUC{$state} if exists $$CanadaState_Name2AbbrUC{$state};
            return $$UsState_Name2AbbrUC{$state}     if exists $$UsState_Name2AbbrUC{$state};
        };

# ............................................................................
subtype 'SupportedCountryName',
    as 'Str',
        where {
            /^(United States|Canada)$/;
        },
        message { "Supported countries are: 'United States' or 'Canada'" };

coerce 'SupportedCountryName',
    from 'Str',
        via {
            return "United States" if /US|USA|UNITED\s+STATES/i;
            return "Canada" if /CANADA/i;
            return $_;
        };

# ............................................................................
1;
