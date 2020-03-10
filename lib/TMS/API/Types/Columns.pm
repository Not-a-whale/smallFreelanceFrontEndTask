package TMS::API::Types::Columns;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Date::Manip;
use Data::Random qw(:all);

use Moose::Util::TypeConstraints;

our $AUTO_GENERATE = 0;

# ............................................................................
subtype 'enum_StopType', as 'Str', where {
    my %options = ('dropoff' => 1, 'pickup' => 1);
    return exists $options{$_};
};

coerce 'enum_StopType', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('dropoff', 'pickup');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Type', as 'Str', where {
    my %options = ('private' => 1, 'public' => 1);
    return exists $options{$_};
};

coerce 'enum_Type', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('private', 'public');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Type', as 'Str', where {
    my %options = ('login' => 1, 'logout' => 1);
    return exists $options{$_};
};

coerce 'enum_Type', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('login', 'logout');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Period', as 'Str', where {
    my %options = (
        'annually'    => 1,
        'bi-annually' => 1,
        'bi-monthly'  => 1,
        'bi-weekly'   => 1,
        'daily'       => 1,
        'monthly'     => 1,
        'null'        => 1,
        'quarterly'   => 1,
        'weekly'      => 1
    );
    return exists $options{$_};
};

coerce 'enum_Period', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('annually', 'bi-annually', 'bi-monthly', 'bi-weekly', 'daily', 'monthly', 'null', 'quarterly', 'weekly');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_LoadType', as 'Str', where {
    my %options = ('ftl' => 1, 'ltl' => 1, 'partial' => 1);
    return exists $options{$_};
};

coerce 'enum_LoadType', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('ftl', 'ltl', 'partial');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Verified', as 'Str', where {
    my %options = ('no' => 1, 'unknown' => 1, 'yes' => 1);
    return exists $options{$_};
};

coerce 'enum_Verified', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('no', 'unknown', 'yes');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_AccountType', as 'Str', where {
    my %options = ('checking' => 1, 'savings' => 1);
    return exists $options{$_};
};

coerce 'enum_AccountType', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('checking', 'savings');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_AppointmentType', as 'Str', where {
    my %options = ('appointment' => 1, 'time open' => 1);
    return exists $options{$_};
};

coerce 'enum_AppointmentType', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('appointment', 'time open');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_BolPod', as 'Str', where {
    my %options = ('na' => 1, 'no' => 1, 'yes' => 1);
    return exists $options{$_};
};

coerce 'enum_BolPod', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('na', 'no', 'yes');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Status', as 'Str', where {
    my %options = ('na' => 1, 'ok' => 1, 'repair' => 1);
    return exists $options{$_};
};

coerce 'enum_Status', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('na', 'ok', 'repair');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_RateType', as 'Str', where {
    my %options = (
        'biweekly'        => 1,
        'flat rate'       => 1,
        'hourly'          => 1,
        'load percentage' => 1,
        'mileage'         => 1,
        'monthly'         => 1,
        'salary'          => 1,
        'weekly'          => 1
    );
    return exists $options{$_};
};

coerce 'enum_RateType', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('biweekly', 'flat rate', 'hourly', 'load percentage', 'mileage', 'monthly', 'salary', 'weekly');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Purpose', as 'Str', where {
    my %options = ('billing' => 1, 'billing and payment' => 1, 'other' => 1, 'payment' => 1);
    return exists $options{$_};
};

coerce 'enum_Purpose', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('billing', 'billing and payment', 'other', 'payment');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Classification', as 'Str', where {
    my %options = ('customer' => 1, 'vendor' => 1);
    return exists $options{$_};
};

coerce 'enum_Classification', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('customer', 'vendor');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_DontUse', as 'Str', where {
    my %options = ('can use' => 1, 'do not use' => 1);
    return exists $options{$_};
};

coerce 'enum_DontUse', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('can use', 'do not use');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_DebitCredit', as 'Str', where {
    my %options = ('credit' => 1, 'debit' => 1);
    return exists $options{$_};
};

coerce 'enum_DebitCredit', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('credit', 'debit');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_InspectionType', as 'Str', where {
    my %options = ('90 days' => 1, 'annually' => 1, 'quarterly' => 1);
    return exists $options{$_};
};

coerce 'enum_InspectionType', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('90 days', 'annually', 'quarterly');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_CrType', as 'Str', where {
    my %options = ('brokerage only' => 1, 'company carrier' => 1);
    return exists $options{$_};
};

coerce 'enum_CrType', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('brokerage only', 'company carrier');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Suffix', as 'Str', where {
    my %options = ('' => 1, 'i' => 1, 'ii' => 1, 'iii' => 1, 'iv' => 1, 'jr' => 1, 'sr' => 1);
    return exists $options{$_};
};

coerce 'enum_Suffix', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('', 'i', 'ii', 'iii', 'iv', 'jr', 'sr');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'set_Type', as 'Str', where {
    my %options = ('sprinter' => 1, 'trailer' => 1, 'truck' => 1);
    return scalar(grep { not exists $options{$_} } split(/,/, $_)) == 0;
};

coerce 'set_Type', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('sprinter', 'trailer', 'truck');
        return join(',', rand_set(set => \@list, min => 1, max => scalar(@list), shuffle => 1));
    } else {
        join(',', map { s/(^\s+|\s+$)//g; s/\s+/ /g; lc($_) } split(',', $_));
    }
};

coerce 'set_Type', from 'HashRef', via {
    my @list   = ('sprinter', 'trailer', 'truck');
    my %posted = map { lc($_), 1 } keys %$_;
    join(',', grep {defined} map { exists $posted{$_} ? $_ : undef } @list);
};

# ............................................................................
subtype 'enum_Method', as 'Str', where {
    my %options = ('get' => 1, 'post' => 1);
    return exists $options{$_};
};

coerce 'enum_Method', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('get', 'post');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_ID_Type', as 'Str', where {
    my %options = ('ein' => 1, 'itin' => 1, 'ssn' => 1);
    return exists $options{$_};
};

coerce 'enum_ID_Type', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('ein', 'itin', 'ssn');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Status', as 'Str', where {
    my %options = ('active' => 1, 'leave of absence' => 1, 'suspended' => 1, 'terminated' => 1);
    return exists $options{$_};
};

coerce 'enum_Status', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('active', 'leave of absence', 'suspended', 'terminated');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Status', as 'Str', where {
    my %options = ('invalid' => 1, 'pending' => 1, 'valid' => 1);
    return exists $options{$_};
};

coerce 'enum_Status', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('invalid', 'pending', 'valid');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Type', as 'Str', where {
    my %options = ('by date' => 1, 'cash' => 1, 'standard' => 1);
    return exists $options{$_};
};

coerce 'enum_Type', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('by date', 'cash', 'standard');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Rule', as 'Str', where {
    my %options = ('fixed amount' => 1, 'percentage' => 1);
    return exists $options{$_};
};

coerce 'enum_Rule', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('fixed amount', 'percentage');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Status', as 'Str', where {
    my %options = ('failed' => 1, 'other' => 1, 'passed' => 1, 'postponed' => 1);
    return exists $options{$_};
};

coerce 'enum_Status', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('failed', 'other', 'passed', 'postponed');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_AuthorityLevel', as 'Str', where {
    my %options = ('executive' => 1, 'member' => 1, 'vise' => 1);
    return exists $options{$_};
};

coerce 'enum_AuthorityLevel', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('executive', 'member', 'vise');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'set_Features', as 'Str', where {
    my %options = ('fax' => 1, 'mms' => 1, 'sms' => 1, 'voice' => 1);
    return scalar(grep { not exists $options{$_} } split(/,/, $_)) == 0;
};

coerce 'set_Features', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('fax', 'mms', 'sms', 'voice');
        return join(',', rand_set(set => \@list, min => 1, max => scalar(@list), shuffle => 1));
    } else {
        join(',', map { s/(^\s+|\s+$)//g; s/\s+/ /g; lc($_) } split(',', $_));
    }
};

coerce 'set_Features', from 'HashRef', via {
    my @list   = ('fax', 'mms', 'sms', 'voice');
    my %posted = map { lc($_), 1 } keys %$_;
    join(',', grep {defined} map { exists $posted{$_} ? $_ : undef } @list);
};

# ............................................................................
subtype 'enum_ScheduleType', as 'Str', where {
    my %options = ('loan' => 1, 'one-time charge' => 1, 'recurring charge' => 1);
    return exists $options{$_};
};

coerce 'enum_ScheduleType', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('loan', 'one-time charge', 'recurring charge');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_UnitType', as 'Str', where {
    my %options = ('department' => 1, 'group' => 1, 'office' => 1, 'other' => 1, 'team' => 1);
    return exists $options{$_};
};

coerce 'enum_UnitType', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('department', 'group', 'office', 'other', 'team');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_TripStatus', as 'Str', where {
    my %options = ('cancelled' => 1, 'complete' => 1, 'dispatched' => 1, 'other' => 1, 'pending' => 1, 'tonu' => 1);
    return exists $options{$_};
};

coerce 'enum_TripStatus', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('cancelled', 'complete', 'dispatched', 'other', 'pending', 'tonu');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_TempMode', as 'Str', where {
    my %options = ('continuous' => 1, 'start/stop' => 1);
    return exists $options{$_};
};

coerce 'enum_TempMode', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('continuous', 'start/stop');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Prefix', as 'Str', where {
    my %options = ('' => 1, 'dr.' => 1, 'madam' => 1, 'mr.' => 1, 'mrs.' => 1, 'ms.' => 1, 'sir' => 1);
    return exists $options{$_};
};

coerce 'enum_Prefix', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('', 'dr.', 'madam', 'mr.', 'mrs.', 'ms.', 'sir');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_MaritalStatus', as 'Str', where {
    my %options = ('divorsed' => 1, 'married' => 1, 'single' => 1, 'widowed' => 1);
    return exists $options{$_};
};

coerce 'enum_MaritalStatus', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('divorsed', 'married', 'single', 'widowed');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Activity', as 'Str', where {
    my %options = ('driving' => 1, 'off duty' => 1, 'on duty' => 1, 'sleeping' => 1);
    return exists $options{$_};
};

coerce 'enum_Activity', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('driving', 'off duty', 'on duty', 'sleeping');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Status', as 'Str', where {
    my %options = ('invalid' => 1, 'invoiced' => 1, 'paid' => 1, 'pending' => 1);
    return exists $options{$_};
};

coerce 'enum_Status', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('invalid', 'invoiced', 'paid', 'pending');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_TeamRequired', as 'Str', where {
    my %options = ('no' => 1, 'yes' => 1);
    return exists $options{$_};
};

coerce 'enum_TeamRequired', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('no', 'yes');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_PriceType', as 'Str', where {
    my %options = ('flat rate' => 1, 'percentage' => 1);
    return exists $options{$_};
};

coerce 'enum_PriceType', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('flat rate', 'percentage');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Fuel', as 'Str', where {
    my %options = ('deisel' => 1, 'none' => 1, 'unleaded' => 1);
    return exists $options{$_};
};

coerce 'enum_Fuel', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('deisel', 'none', 'unleaded');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_PaidBy', as 'Str', where {
    my %options = ('company' => 1, 'owner' => 1);
    return exists $options{$_};
};

coerce 'enum_PaidBy', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('company', 'owner');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Mobility', as 'Str', where {
    my %options = ('land line' => 1, 'mobile' => 1, 'soft phone' => 1);
    return exists $options{$_};
};

coerce 'enum_Mobility', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('land line', 'mobile', 'soft phone');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'enum_Gender', as 'Str', where {
    my %options = ('female' => 1, 'male' => 1);
    return exists $options{$_};
};

coerce 'enum_Gender', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('female', 'male');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

1;
