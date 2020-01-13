package TMS::API::Types::Simple;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Date::Manip;
use Digest::SHA qw(sha256_hex);
use MIME::Base64;

use Text::Lorem::More;
use Data::Random qw(:all);

use Moose::Util::TypeConstraints;
use MooseX::Types::Moose qw(Int Str);

our $AUTO_GENERATE = 0;
$Data::Dumper::Terse = 1;

my $DateObj = new Date::Manip::Date;

# ............................................................................
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

my $UsState_Abbr2NameUC = {map { $_, uc($$UsState_Abbr2Name{$_}) } keys %$UsState_Abbr2Name};
my $UsState_Name2Abbr   = {map { $$UsState_Abbr2Name{$_}, $_ } keys %$UsState_Abbr2Name};
my $UsState_Name2AbbrUC = {map { uc($$UsState_Abbr2Name{$_}), $_ } keys %$UsState_Abbr2Name};

# ............................................................................
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

my $CanadaState_Abbr2NameUC = {map { $_, uc($$CanadaState_Abbr2Name{$_}) } keys %$CanadaState_Abbr2Name};
my $CanadaState_Name2Abbr   = {map { $$CanadaState_Abbr2Name{$_}, $_ } keys %$CanadaState_Abbr2Name};
my $CanadaState_Name2AbbrUC = {map { uc($$CanadaState_Abbr2Name{$_}), $_ } keys %$CanadaState_Abbr2Name};

# ............................................................................
my %rgx = (
    isTidy     => qr/^\S+$|^(\S+\s)+\S+$|^$/,
    isUpper    => qr/[^a-z]/,
    isUCfirst  => qr/^(?:([A-Z][a-z\.]*)\s*)+$/,
    isLogin    => qr/^[a-z][a-z0-9_]{2,15}$/,
    isCronTab  => qr/^([0-9,\-\/\*]+\s){4}[0-7,\-\/\*]+$/,
    isDateTime => qr/^(\d{4})-(\d\d)-(\d\d) (\d\d):(\d\d):(\d\d)$/,
    isCurrency => qr/^(?:\-)?\d+(?:\.\d+)$/,
    isPhoneExt => qr/^[0-9\#\*,]{1,}$/,
    isPhoneNum => qr/^\d{3}\-\d{3}\-\d{4}$/,
    isFloat    => qr/^\-?(\d+|\.\d+|\d+(?:\.\d+)?)$/,
    isPriKey   => qr/^[1-9]\d*$/,
    isPosInt   => qr/^\d+$/,
    isBoolInt  => qr/^[01]$/,
    canBoolInt => qr/^\s*(yes|no|true|false|1|0)\s*$/,
    yesBoolInt => qr/^\s*(yes|true|1)\s*$/,
    isYesNo    => qr/^(yes|no)$/,
    isSha256   => qr/^[0-9a-f]{64}$/,
    isCountry  => qr/^(United States|Canada)$/,
    isZipCode  => qr/^\d{5}(?:\-\d{4})?$/,
    isBlob     => qr/\S/s,
    isSha256   => qr/^[0-9a-fA-F]{64}$/,
    isMCnum    => qr/^MC\d{6,8}$/,
    isDOTnum   => qr/^USDOT\d{6,}$/,
    isSCAC     => qr/^[A-Z]{2,4}$/,
    isDUNS     => qr/^\d{9}$/,
    isEmail    => qr/^[^\s\@]+\@[^\.\s]+(\.[^\.\s]+)+$/,
    isPerson   => qr/^[A-Z \.]{2,63}$/,
);

# ............................................................................
subtype 'TidySpacesString', as 'Str', where {/$rgx{isTidy}/};
coerce 'TidySpacesString', from 'Str', via { tryTidySpacesString($_) };

subtype 'UpperCaseStr', as 'Str', where {/$rgx{isUpper}/};
coerce 'UpperCaseStr', from 'Str', via { tryUpperCaseStr($_) };

subtype 'PrimaryKeyInt', as 'Int', where {/$rgx{isPriKey}/};
coerce 'PrimaryKeyInt', from 'Str', via { tryPrimaryKeyInt($_) };

subtype 'PositiveInt', as 'Int', where {/$rgx{isPosInt}/};
coerce 'PositiveInt', from 'Str', via { tryPositiveInt($_) };

subtype 'BoolInt', as 'Int', where {/$rgx{isBoolInt}/};
coerce 'BoolInt', from 'Str', via { tryBoolInt($_) };

subtype 'UserNameLowerCase', as 'Str', where {/$rgx{isLogin}/};
coerce 'UserNameLowerCase', from 'Str', via { tryUserNameLowerCase($_) };

subtype 'EnumYesNo', as 'Str', where {/$rgx{isYesNo}/};
coerce 'EnumYesNo', from 'Str', via { tryEnumYesNo($_) };

subtype 'CronTabTime', as 'Str', where {/$rgx{isCronTab}/};
coerce 'CronTabTime', from 'Str', via { tryTidySpacesString($_) };

subtype 'Sha256Password', as 'Str', where {/$rgx{isSha256}/i};
coerce 'Sha256Password', from 'Str', via { trySha256Password($_) };

subtype 'DATETIME', as 'Str', where { isDateTime($_) };
coerce 'DATETIME', from 'Str', via { tryDateTime($_) };

subtype 'DbDuration', as 'Int', where {/$rgx{isPosInt}/};
coerce 'DbDuration', from 'Str', via { tryDbDuration($_) };

subtype 'CurrencyValue', as 'Str', where {/$rgx{isCurrency}/};
coerce 'CurrencyValue', from 'Str', via { tryFloat($_) };

subtype 'PhoneExt', as 'Str', where {/$rgx{isPhoneExt}/};
coerce 'PhoneExt', from 'Str', via { tryPhoneExt($_) };

subtype 'PhoneNumber', as 'Str', where {/$rgx{isPhoneNum}/};
coerce 'PhoneNumber', from 'Str', via { tryPhoneNumber($_) };

subtype 'Float', as 'Str', where {/$rgx{isFloat}/};
coerce 'Float', from 'Str', via { tryFloat($_) };

subtype 'SupportedStateName', as 'Str', where { isSupportedStateName($_) };
coerce 'SupportedStateName', from 'Str', via { trySupportedStateName($_) };

subtype 'SupportedStateAbbr', as 'Str', where { isSupportedStateAbbr($_) };
coerce 'SupportedStateAbbr', from 'Str', via { trySupportedStateAbbr($_) };

subtype 'SupportedCountryName', as 'Str', where {/$rgx{isCountry}/};
coerce 'SupportedCountryName', from 'Str', via { trySupportedCountryName($_) };

subtype 'Street', as 'Str', where { isMinMax($_, 2, 64) && isUpperCaseStr($_) };
coerce 'Street', from 'Str', via { tryUpperCaseStr(tryMinMax($_, 2, 64)) };

subtype 'City', as 'Str', where { isMinMax($_, 2, 64) && isUpperCaseStr($_) };
coerce 'City', from 'Str', via { tryUpperCaseStr(tryMinMax($_, 2, 64)) };

subtype 'ZipCanadaUSA', as 'Str', where {/$rgx{isZipCode}/};
coerce 'ZipCanadaUSA', from 'Str', via { tryZipCanadaUSA($_) };

subtype 'BizName', as 'Str', where { /$rgx{isTidy}/ && /$rgx{isUpper}/ };
coerce 'BizName', from 'Str', via { tryUpperCaseStr($_) };

subtype 'VIN', as 'Str', where { isVIN($_) }, message {
    "The VIN you provided is invalid format. Please check and try again."
};

subtype 'Blob', as 'Str', where {/$rgx{isBlob}/};
coerce 'Blob', from 'Str', via { tryBlob($_) };

subtype 'Sha256', as 'Str', where {/$rgx{isSha256}/};
coerce 'Sha256', from 'Str', via { trySha256($_) };

subtype 'MCnum', as 'Str', where {/$rgx{isMCnum}/};
coerce 'MCnum', from 'Str', via { tryMCnum($_) };

subtype 'DOTnum', as 'Str', where {/$rgx{isDOTnum}/};
coerce 'DOTnum', from 'Str', via { tryDOTnum($_) };

subtype 'SCAC', as 'Str', where {/$rgx{isSCAC}/};
coerce 'SCAC', from 'Str', via { trySCAC($_) };

subtype 'DUNS', as 'Str', where {/$rgx{isDUNS}/};
coerce 'DUNS', from 'Str', via { tryDUNS($_) };

subtype 'Bonds', as 'Str', where { isMinMax($_, 2, 64) };
coerce 'Bonds', from 'Str', via { tryUpperCaseStr(tryMinMax($_, 2, 64)) };

subtype 'Email', as 'Str', where {/$rgx{isEmail}/};
coerce 'Email', from 'Str', via { tryEmail($_) };

subtype 'Person', as 'Str', where {/$rgx{isPerson}/};
coerce 'Person', from 'Str', via { tryPerson($_) };

# ............................................................................
sub _auto_ok { $AUTO_GENERATE && (!defined $_[0] || $_[0] !~ /\S+/s) ? 1 : 0 }

sub isTidySpacesString {
    my $text = shift;
    return undef unless defined $text;
    return 1 if $text =~ /^\S+(\s\S+)*$/ms;
    return undef;
}

sub tryTidySpacesString {
    my $text = shift;
    return Text::Lorem::More->new->description() if _auto_ok($text);
    return undef if !defined $text;
    $text =~ s/^\s+|\s+$//gs;
    $text =~ s/\s+/ /gs;
    return $text;
}

sub isUpperCaseStr {
    my $text = shift;
    return undef unless defined $text;
    return 1 if isTidySpacesString($text) && $text !~ /[a-z]/ms;
    return undef;
}

sub tryUpperCaseStr {
    my $text = tryTidySpacesString(shift);
    $text = Text::Lorem::More->new->description() if _auto_ok($text);
    return undef if !defined $text;
    return uc($text);
}

sub tryPrimaryKeyInt {
    my $text = shift;
    return int(rand(999999999)) if _auto_ok($text);
    $text =~ s/\D+//g;
    return undef if !/\d+/;
    return $text;
}

sub tryPositiveInt {
    my $text = $_[0];

    return int(rand(999999999)) if _auto_ok($text);

    $text =~ s/\D+//g;
    return $text =~ /^\d+$/ ? $text : $_[0];
}

sub tryBoolInt {
    my $text = shift;

    return rand_enum(set => [0, 1]) if _auto_ok($text);

    return 0 if !defined $text;
    return ($text =~ /$rgx{yesBoolInt}/i ? 1 : 0) if $text =~ /$rgx{canBoolInt}/i;
    return $text;
}

sub tryUserNameLowerCase {
    my $text = shift;
    if (_auto_ok($text)) {
        return join("",
            rand_chars(set => "loweralpha", min => 3, max => 5),
            map {lc} rand_chars(set => "alphanumeric", min => 1, max => 7));
    } else {
        $text =~ s/[^a-z0-9_].*//gi;
        return lc($text);
    }
}

sub tryEnumYesNo {
    my $text = $_[0];

    return rand_enum(set => ['yes', 'no']) if _auto_ok($text);

    return 'no' if !defined($text);

    $text =~ s/\s//g;
    $text =~ s/.*(yes|no).*/$1/i;
    return $_[0] if $text !~ /$rgx{isYesNo}/i;    # return original on error
    return lc($text);
}

sub trySha256Password {
    my $text = shift;
    if (_auto_ok($text)) {
        $text = rand_chars(set => "all", min => 6, max => 15);
    } else {
        return 'Short Password' if $text !~ /.{6,}/;
        return 'Missing digits' if $text !~ /[0-9]/;
        return 'No upper case'  if $text !~ /[A-Z]/;
        return 'No lower case'  if $text !~ /[a-z]/;
    }
    return sha256_hex($text);
}

sub isDateTime {
    my $date = shift;
    if ($date =~ /$rgx{isDateTime}/) {
        my @max = (undef, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
        return undef if $1 < 1900 && $1 > 2100;
        return undef if $2 < 1    && $2 > 12;
        return undef if $3 < 1    && $3 > $max[$2];
        return undef if $4 < 0    && $4 > 23;
        return undef if $5 < 0    && $5 > 59;
        return undef if $6 < 0    && $6 > 59;
        return 1;
    }
    return undef;
}

sub tryDateTime {
    my $text = $_[0];
    return rand_datetime() if _auto_ok($text);
    return $_[0] if $DateObj->parse($text);    # return original on error
    return $DateObj->printf('%Y-%m-%d %H:%M:%S');
}

sub tryDbDuration {    # ! HAS NO AUTO_GENERATE
    my $time     = shift;
    my $delta    = 1;
    my $duration = 0;
    $duration += ($time =~ /(\d+)\s*m/i ? $1 : 0) * ($delta *= 60);    # (1M) minutes
    $duration += ($time =~ /(\d+)\s*h/i ? $1 : 0) * ($delta *= 60);    # (1H) hours
    $duration += ($time =~ /(\d+)\s*d/i ? $1 : 0) * ($delta *= 24);    # (1D) days
    $duration += ($time =~ /(\d+)\s*b/i ? $1 : 0) * ($delta *= 8);     # (1B) 8 hrs business day
    $duration += ($time =~ /(\d+)\s*l/i ? $1 : 0) * ($delta *= 8);     # (1L) 12 hrs long business day
    $duration += ($time =~ /(\d+)\s*w/i ? $1 : 0) * ($delta *= 7);     # (1W) weeks
    $duration += ($time =~ /(\d+)\s*r/i ? $1 : 0) * ($delta *= 5);     # (1R) 5 days woRk weeks
    return $duration;
}

sub CurrencyValue {
    my $money = $_[0];
    $money =~ s/[^\d\.\-\(\)]//g;                                      # remove all if not of "0-9.-()"
    $money = sprintf "%6.2f", rand(10000) if _auto_ok($money);

    return $_[0] if $money !~ /^[^\d\.\-\(\)]+$/;                      # return original value if we dont have digits

    my $isnegative = ($money =~ m/-(.*)/) ? 1 : 0;
    my $value = ($isnegative ? $1 : undef) || $money;

    $isnegative = ($money =~ m/\((.*)\)/) ? 1 : 0 || $isnegative;
    $value = ($isnegative ? $1 : undef) || $value;

    my $sign = $isnegative ? '-' : '';
    $value =~ m/(\d*(?:\.\d*)?)/;
    my $number = $1 || 0;

    return sprintf('%s%0.2f', ($sign, $number));
}

sub tryPhoneExt {
    my $ext = $_[0];
    $ext =~ s/[^0-9\#\*,]//gs;
    if (_auto_ok($ext)) {
        my $ext  = undef;
        my @nums = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '#', ',', '*');
        $ext .= $nums[int(rand(13))] for 1 .. 9;
        $ext .= $nums[int(rand(10))];
        return $ext;
    }
    return $ext =~ /$rgx{isPhoneExt}/ ? $ext : $_[0];
}

sub tryPhoneNumber {
    my $phn = $_[0];
    if (_auto_ok($phn)) {
        my $phone = 0;
        $phone = int(rand(9999999999)) while $phone < 1000000000;
        $phone =~ s/(\d{3})(\d{3})(\d{4})$/$1\-$2\-$3/;
        return $phone;
    } else {
        $phn =~ s/\D+//g;
        $phn =~ s/.*?(\d{3})(\d{3})(\d{4})$/$1\-$2\-$3/;
        return $phn;
    }
}

sub isVIN {
    my $vin = shift;
    return undef if (length $vin != 17);
    return undef if (substr($vin, 8, 1) !~ /\d/);
    my $map      = '0123456789X';
    my $weights  = '8765432X098765432';
    my $translit = '0123456789.ABCDEFGH..JKLMN.P.R..STUVWXYZ';
    my $sum      = 0;
    foreach my $i (0 .. length $vin) {
        $sum += index($translit, substr($vin, $i, 1)) % 10 * index($map, substr($weights, $i, 1));
    }
    return substr($map, $sum % 11, 1) == substr($vin, 8, 1);
}

sub tryFloat {
    my $num = $_[0];
    $num =~ s/[^\d\.\-]//g;
    return sprintf "%6.2f", rand(10000) if _auto_ok($num);
    return $num =~ /$rgx{isFloat}/ ? $num : $_[0];
}

sub isSupportedStateName {
    my $state = shift;
    return exists $$UsState_Name2Abbr{$state} || exists $$CanadaState_Name2Abbr{$state};
}

sub trySupportedStateName {
    my $state = uc($_[0]);

    return rand_enum(set => [values %$UsState_Abbr2Name]) if _auto_ok($state);

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
    return $_[0];
}

sub isSupportedStateAbbr {
    my $state = shift;
    return exists $$UsState_Abbr2Name{$state} || exists $$CanadaState_Abbr2Name{$state};
}

sub trySupportedStateAbbr {
    my $state = uc($_[0]);

    return rand_enum(set => [keys %$UsState_Abbr2Name]) if _auto_ok($state);

    $state =~ s/^\s+//;
    $state =~ s/\s+$//;
    $state =~ s/\s+/ /g;

    return $state if exists $$UsState_Abbr2NameUC{$state} || exists $$CanadaState_Abbr2NameUC{$_};
    return $$CanadaState_Name2AbbrUC{$state} if exists $$CanadaState_Name2AbbrUC{$state};
    return $$UsState_Name2AbbrUC{$state}     if exists $$UsState_Name2AbbrUC{$state};
    return $_[0];
}

sub trySupportedCountryName {
    my $country = shift;
    return rand_enum(set => ['United States', 'Canada']) if _auto_ok($country);
    return "United States" if $country =~ /\b(US|USA|UNITED\s+STATES)\b/i;
    return "Canada"        if $country =~ /\bCANADA\b/i;
    return $country;
}

sub isMinMax {
    my ($text, $min, $max) = @_;
    my $len = length($text);
    return ($len >= $min && $len <= $max);
}

sub tryMinMax {
    my ($text, $min, $max) = @_;
    return undef if !defined $text || $text eq '';
    my $valid = substr(tryTidySpacesString($text), 0, $max);
    return undef if !defined $text || $text eq '';
    my $len = length($valid);
    return $valid if $len >= $min && $len <= $max;
    return $text;
}

sub tryZipCanadaUSA {
    my $zip = $_[0];
    if (_auto_ok($zip)) {
        my $first_part  = 0;
        my $second_part = 0;
        $first_part  = int(rand(99999)) while $first_part < 10000;
        $second_part = int(rand(9999))  while $second_part < 1000;
        return "$first_part\-$second_part";
    }
    $zip =~ s/\D+//;
    if ($zip =~ /(\d{5})(\d{4})/) {
        return "$1-$2";
    } elsif ($zip =~ /(\d{5})/) {
        return "$1";
    } else {
        return $_[0];    # return original as is
    }
}

sub tryBlob {
    my $data = shift;
    return encode_base64(
        rand_image(
            minwidth  => 100,
            maxwidth  => 200,
            minheight => 100,
            maxheight => 200,
            minpixels => 256
        )
    ) if _auto_ok($data);
    return $data;
}

sub trySha256 {
    my $data = shift;
    $data = encode_base64(
        rand_image(
            minwidth  => 100,
            maxwidth  => 200,
            minheight => 100,
            maxheight => 200,
            minpixels => 256
        )
    ) if _auto_ok($data);
    return sha256_hex($data);
}

sub tryMCnum {
    my $text = $_[0];
    if (_auto_ok($text)) {
        my $mc = 0;
        $mc = int(rand(99999999)) while $mc < 1000000;
        return "MC$mc";
    }
    $text =~ s/\D+//g;
    $text = 'MC' . $text;
    return $text =~ /$rgx{isMCnum}/ ? $text : $_[0];
}

sub tryDOTnum {
    my $text = $_[0];
    if (_auto_ok($text)) {
        my $dot = 0;
        $dot = int(rand(99999999)) while $dot < 10000;
        return "USDOT$dot";
    }
    $text =~ s/\D+//g;
    $text = 'USDOT' . $text;
    return $text =~ /$rgx{isDOTnum}/ ? $text : $_[0];
}

sub trySCAC {
    my $text = uc($_[0]);

    return rand_chars(set => 'upperalpha', min => 2, max => 4) if _auto_ok($text);

    $text =~ s/\s+//g;
    return $text =~ /$rgx{isSCAC}/ ? $text : $_[0];
}

sub tryDUNS {
    my $text = $_[0];
    if (_auto_ok($text)) {
        my $duns = 0;
        $duns = int(rand(999999999)) while $duns < 100000000;
        return $duns;
    }
    $text =~ s/\D+//g;
    return $text =~ /$rgx{isDUNS}/ ? $text : $_[0];
}

sub tryEmail {
    my $text = $_[0];
    if (_auto_ok($text)) {
        return
              rand_chars(set => 'alphanumeric', min => 3, max => 10) . '@'
            . rand_chars(set => 'alphanumeric', min => 3, max => 10) . '.'
            . rand_enum(set => [qw( com net org gov biz us ca uk fr ch ru ua )]);
    }
    $text =~ s/\s+//g;
    return $text =~ /$rgx{isEmail}/ ? $text : $_[0];
}

sub tryPerson {
    my $text = shift;
    $text = Text::Lorem::More->new->name if _auto_ok($text);
    $text = tryTidySpacesString($text);
    return undef if !defined $text;
    return uc($text);
}

1;
