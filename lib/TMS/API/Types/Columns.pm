package TMS::API::Types::Columns;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Date::Manip;

use Moose::Util::TypeConstraints;

#AUTO-GENERATED
# ............................................................................
subtype 'EnumCustomer',
    as 'Str',
        where { m{(?^:^customer$|^vendor$)}; };
# ............................................................................
subtype 'EnumPassed',
    as 'Str',
        where { m{(?^:^Passed$|^Failed$|^Postponed$|^Other$)}; };
# ............................................................................
subtype 'EnumStandard',
    as 'Str',
        where { m{(?^:^STANDARD$|^BY DATE$|^CASH$)}; };
# ............................................................................
subtype 'EnumOnDuty',
    as 'Str',
        where { m{(?^:^ON DUTY$|^OFF DUTY$|^DRIVING$|^SLEEPING$)}; };
# ............................................................................
subtype 'EnumHourly',
    as 'Str',
        where { m{(?^:^hourly$|^salary$|^weekly$|^biweekly$|^monthly$|^mileage$|^load percentage$|^flat rate$)}; };
# ............................................................................
subtype 'EnumDoNotUse',
    as 'Str',
        where { m{(?^:^do not use$|^can use$|^$)}; };
# ............................................................................
subtype 'EnumOwner',
    as 'Str',
        where { m{(?^:^Owner$|^Company$|^$)}; };
# ............................................................................
subtype 'SetVoice',
    as 'Str',
        where {
                
                my %vals = map {$_ => 1} split( /,/, 'VOICE,SMS,MMS,FAX' );
                return scalar ( grep { not exists $vals{$_} } split(/,/, $_)) == 0;
            };
coerce 'SetVoice',
    from 'Str',
        via {
                my %vals = map {$_ => 1} split( ',', 'VOICE,SMS,MMS,FAX' );
                return join(',', do{ my %u; grep { exists $vals{$_} } grep { !$u{$_}++ } split(',', $_)});
            };
# ............................................................................
subtype 'EnumNa',
    as 'Str',
        where { m{(?^:^NA$|^OK$|^REPAIR$)}; };
# ............................................................................
subtype 'SetTruck',
    as 'Str',
        where {
                
                my %vals = map {$_ => 1} split( /,/, 'Truck,Trailer,Sprinter' );
                return scalar ( grep { not exists $vals{$_} } split(/,/, $_)) == 0;
            };
coerce 'SetTruck',
    from 'Str',
        via {
                my %vals = map {$_ => 1} split( ',', 'Truck,Trailer,Sprinter' );
                return join(',', do{ my %u; grep { exists $vals{$_} } grep { !$u{$_}++ } split(',', $_)});
            };
# ............................................................................
subtype 'EnumInvalid',
    as 'Str',
        where { m{(?^:^invalid$|^pending$|^invoiced$|^paid$)}; };
# ............................................................................
subtype 'EnumDebit',
    as 'Str',
        where { m{(?^:^debit$|^credit$)}; };
# ............................................................................
subtype 'EnumYes',
    as 'Str',
        where { m{(?^:^yes$|^no$|^$)}; };
# ............................................................................
subtype 'EnumLandLine',
    as 'Str',
        where { m{(?^:^LAND LINE$|^MOBILE$|^SOFT PHONE$)}; };
# ............................................................................
subtype 'EnumLoan',
    as 'Str',
        where { m{(?^:^loan$|^one-time charge$|^recurring charge$)}; };
# ............................................................................
subtype 'Enum',
    as 'Str',
        where { m{(?^:^$|^Mr.$|^Mrs.$|^Ms.$|^Dr.$|^Sir$|^Madam$)}; };
# ............................................................................
subtype 'EnumPickup',
    as 'Str',
        where { m{(?^:^PickUp$|^DropOff$)}; };
# ............................................................................
subtype 'EnumSsn',
    as 'Str',
        where { m{(?^:^SSN$|^EIN$|^ITIN$)}; };
# ............................................................................
subtype 'EnumNo',
    as 'Str',
        where { m{(?^:^yes$|^no$|^na$)}; };
# ............................................................................
subtype 'EnumNode',
    as 'Str',
        where { m{(?^:^node$|^popup$|^window$)}; };
# ............................................................................
subtype 'EnumCompanyCarrier',
    as 'Str',
        where { m{(?^:^Company Carrier$|^Brokerage Only$|^$)}; };
# ............................................................................
subtype 'EnumFlatRate',
    as 'Str',
        where { m{(?^:^flat rate$|^percentage$|^$)}; };
# ............................................................................
subtype 'EnumPending',
    as 'Str',
        where { m{(?^:^pending$|^valid$|^invalid$|^$)}; };
# ............................................................................
subtype 'EnumNull',
    as 'Str',
        where { m{(?^:^null$|^annually$|^bi-annually$|^quarterly$|^monthly$|^bi-monthly$|^weekly$|^bi-weekly$|^daily$|^$)}; };
# ............................................................................
subtype 'SetOne',
    as 'Str',
        where {
                
                my %vals = map {$_ => 1} split( /,/, 'one,two,three' );
                return scalar ( grep { not exists $vals{$_} } split(/,/, $_)) == 0;
            };
coerce 'SetOne',
    from 'Str',
        via {
                my %vals = map {$_ => 1} split( ',', 'one,two,three' );
                return join(',', do{ my %u; grep { exists $vals{$_} } grep { !$u{$_}++ } split(',', $_)});
            };
# ............................................................................
subtype 'EnumSr',
    as 'Str',
        where { m{(?^:^$|^Sr$|^Jr$|^I$|^II$|^III$|^IV$)}; };
# ............................................................................
subtype 'EnumAppointment',
    as 'Str',
        where { m{(?^:^Appointment$|^Time Open$)}; };
# ............................................................................
subtype 'EnumNone',
    as 'Str',
        where { m{(?^:^none$|^deisel$|^unleaded$)}; };
# ............................................................................
subtype 'EnumLogin',
    as 'Str',
        where { m{(?^:^Login$|^Logout$)}; };
# ............................................................................
subtype 'EnumDepartment',
    as 'Str',
        where { m{(?^:^Department$|^Office$|^Team$|^Group$|^Other$)}; };
# ............................................................................
subtype 'EnumUnknown',
    as 'Str',
        where { m{(?^:^unknown$|^yes$|^no$)}; };
# ............................................................................
subtype 'EnumQuarterly',
    as 'Str',
        where { m{(?^:^Quarterly$|^Annually$|^90 Days$|^$)}; };
# ............................................................................
subtype 'EnumFtl',
    as 'Str',
        where { m{(?^:^FTL$|^LTL$|^Partial$|^$)}; };
# ............................................................................
subtype 'EnumDispatched',
    as 'Str',
        where { m{(?^:^Pending$|^Dispatched$|^Complete$|^Other$|^TONU$|^Cancelled$)}; };
# ............................................................................
subtype 'EnumContinuous',
    as 'Str',
        where { m{(?^:^continuous$|^start/stop$|^$)}; };

#AUTO-GENERATED

1;