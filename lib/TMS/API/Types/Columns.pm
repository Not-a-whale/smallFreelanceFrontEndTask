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
subtype 'EnumInvalid',
    as 'Str',
        where { m{(?^:(?i)^invalid$|^pending$|^invoiced$|^paid$)}; };
# ............................................................................
subtype 'EnumNone',
    as 'Str',
        where { m{(?^:(?i)^none$|^deisel$|^unleaded$)}; };
# ............................................................................
subtype 'EnumDepartment',
    as 'Str',
        where { m{(?^:(?i)^Department$|^Office$|^Team$|^Group$|^Other$)}; };
# ............................................................................
subtype 'EnumNo',
    as 'Str',
        where { m{(?^:(?i)^yes$|^no$|^na$)}; };
# ............................................................................
subtype 'EnumSr',
    as 'Str',
        where { m{(?^:(?i)^$|^Sr$|^Jr$|^I$|^II$|^III$|^IV$)}; };
# ............................................................................
subtype 'EnumNull',
    as 'Str',
        where { m{(?^:(?i)^null$|^annually$|^bi-annually$|^quarterly$|^monthly$|^bi-monthly$|^weekly$|^bi-weekly$|^daily$|^$)}; };
# ............................................................................
subtype 'EnumPassed',
    as 'Str',
        where { m{(?^:(?i)^Passed$|^Failed$|^Postponed$|^Other$)}; };
# ............................................................................
subtype 'EnumCompanyCarrier',
    as 'Str',
        where { m{(?^:(?i)^Company Carrier$|^Brokerage Only$|^$)}; };
# ............................................................................
subtype 'EnumFlatRate',
    as 'Str',
        where { m{(?^:(?i)^flat rate$|^percentage$|^$)}; };
# ............................................................................
subtype 'EnumNa',
    as 'Str',
        where { m{(?^:(?i)^NA$|^OK$|^REPAIR$)}; };
# ............................................................................
subtype 'EnumCustomer',
    as 'Str',
        where { m{(?^:(?i)^customer$|^vendor$)}; };
# ............................................................................
subtype 'EnumQuarterly',
    as 'Str',
        where { m{(?^:(?i)^Quarterly$|^Annually$|^90 Days$|^$)}; };
# ............................................................................
subtype 'EnumLandLine',
    as 'Str',
        where { m{(?^:(?i)^LAND LINE$|^MOBILE$|^SOFT PHONE$)}; };
# ............................................................................
subtype 'EnumPickup',
    as 'Str',
        where { m{(?^:(?i)^PickUp$|^DropOff$)}; };
# ............................................................................
subtype 'Enum',
    as 'Str',
        where { m{(?^:(?i)^$|^Mr.$|^Mrs.$|^Ms.$|^Dr.$|^Sir$|^Madam$)}; };
# ............................................................................
subtype 'EnumFtl',
    as 'Str',
        where { m{(?^:(?i)^FTL$|^LTL$|^Partial$|^$)}; };
# ............................................................................
subtype 'EnumContinuous',
    as 'Str',
        where { m{(?^:(?i)^continuous$|^start/stop$|^$)}; };
# ............................................................................
subtype 'EnumSsn',
    as 'Str',
        where { m{(?^:(?i)^SSN$|^EIN$|^ITIN$)}; };
# ............................................................................
subtype 'EnumLogin',
    as 'Str',
        where { m{(?^:(?i)^Login$|^Logout$)}; };
# ............................................................................
subtype 'EnumDoNotUse',
    as 'Str',
        where { m{(?^:(?i)^do not use$|^can use$|^$)}; };
# ............................................................................
subtype 'EnumDebit',
    as 'Str',
        where { m{(?^:(?i)^debit$|^credit$)}; };
# ............................................................................
subtype 'EnumOwner',
    as 'Str',
        where { m{(?^:(?i)^Owner$|^Company$|^$)}; };
# ............................................................................
subtype 'EnumAppointment',
    as 'Str',
        where { m{(?^:(?i)^Appointment$|^Time Open$)}; };
# ............................................................................
subtype 'EnumPending',
    as 'Str',
        where { m{(?^:(?i)^pending$|^valid$|^invalid$|^$)}; };
# ............................................................................
subtype 'EnumYes',
    as 'Str',
        where { m{(?^:(?i)^yes$|^no$|^$)}; };
# ............................................................................
subtype 'EnumUnknown',
    as 'Str',
        where { m{(?^:(?i)^unknown$|^yes$|^no$)}; };
# ............................................................................
subtype 'EnumLoan',
    as 'Str',
        where { m{(?^:(?i)^loan$|^one-time charge$|^recurring charge$)}; };
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
subtype 'EnumHourly',
    as 'Str',
        where { m{(?^:(?i)^hourly$|^salary$|^weekly$|^biweekly$|^monthly$|^mileage$|^load percentage$|^flat rate$)}; };
# ............................................................................
subtype 'EnumOnDuty',
    as 'Str',
        where { m{(?^:(?i)^ON DUTY$|^OFF DUTY$|^DRIVING$|^SLEEPING$)}; };
# ............................................................................
subtype 'EnumDispatched',
    as 'Str',
        where { m{(?^:(?i)^Pending$|^Dispatched$|^Complete$|^Other$|^TONU$|^Cancelled$)}; };
# ............................................................................
subtype 'EnumStandard',
    as 'Str',
        where { m{(?^:(?i)^STANDARD$|^BY DATE$|^CASH$)}; };

#AUTO-GENERATED

1;