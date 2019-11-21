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

#AUTO-GENERATED
# ............................................................................
subtype 'EnumPayment', as 'Str', where {
    my %options = ('payment' => 1, 'billing' => 1, 'billing and payment' => 1, 'other' => 1);
    return exists $options{$_};
};

coerce 'EnumPayment', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('payment', 'billing', 'billing and payment', 'other');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumChecking', as 'Str', where {
    my %options = ('checking' => 1, 'savings' => 1);
    return exists $options{$_};
};

coerce 'EnumChecking', from 'Str', via {
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
subtype 'EnumLogin', as 'Str', where {
    my %options = ('login' => 1, 'logout' => 1);
    return exists $options{$_};
};

coerce 'EnumLogin', from 'Str', via {
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
subtype 'EnumLandLine', as 'Str', where {
    my %options = ('land line' => 1, 'mobile' => 1, 'soft phone' => 1);
    return exists $options{$_};
};

coerce 'EnumLandLine', from 'Str', via {
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
subtype 'EnumSr', as 'Str', where {
    my %options = ('' => 1, 'sr' => 1, 'jr' => 1, 'i' => 1, 'ii' => 1, 'iii' => 1, 'iv' => 1);
    return exists $options{$_};
};

coerce 'EnumSr', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('', 'sr', 'jr', 'i', 'ii', 'iii', 'iv');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumDepartment', as 'Str', where {
    my %options = ('department' => 1, 'office' => 1, 'team' => 1, 'group' => 1, 'other' => 1);
    return exists $options{$_};
};

coerce 'EnumDepartment', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('department', 'office', 'team', 'group', 'other');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumFtl', as 'Str', where {
    my %options = ('ftl' => 1, 'ltl' => 1, 'partial' => 1);
    return exists $options{$_};
};

coerce 'EnumFtl', from 'Str', via {
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
subtype 'EnumNull', as 'Str', where {
    my %options = (
        'null'        => 1,
        'annually'    => 1,
        'bi-annually' => 1,
        'quarterly'   => 1,
        'monthly'     => 1,
        'bi-monthly'  => 1,
        'weekly'      => 1,
        'bi-weekly'   => 1,
        'daily'       => 1
    );
    return exists $options{$_};
};

coerce 'EnumNull', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('null', 'annually', 'bi-annually', 'quarterly', 'monthly', 'bi-monthly', 'weekly', 'bi-weekly', 'daily');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumNo', as 'Str', where {
    my %options = ('yes' => 1, 'no' => 1, 'na' => 1);
    return exists $options{$_};
};

coerce 'EnumNo', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('yes', 'no', 'na');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumValid', as 'Str', where {
    my %options = ('pending' => 1, 'valid' => 1, 'invalid' => 1);
    return exists $options{$_};
};

coerce 'EnumValid', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('pending', 'valid', 'invalid');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumUnknown', as 'Str', where {
    my %options = ('unknown' => 1, 'yes' => 1, 'no' => 1);
    return exists $options{$_};
};

coerce 'EnumUnknown', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('unknown', 'yes', 'no');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'Enum', as 'Str', where {
    my %options = ('' => 1, 'mr.' => 1, 'mrs.' => 1, 'ms.' => 1, 'dr.' => 1, 'sir' => 1, 'madam' => 1);
    return exists $options{$_};
};

coerce 'Enum', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('', 'mr.', 'mrs.', 'ms.', 'dr.', 'sir', 'madam');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumActive', as 'Str', where {
    my %options = ('active' => 1, 'terminated' => 1, 'leave of absence' => 1, 'suspended' => 1);
    return exists $options{$_};
};

coerce 'EnumActive', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('active', 'terminated', 'leave of absence', 'suspended');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumInvalid', as 'Str', where {
    my %options = ('invalid' => 1, 'pending' => 1, 'invoiced' => 1, 'paid' => 1);
    return exists $options{$_};
};

coerce 'EnumInvalid', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('invalid', 'pending', 'invoiced', 'paid');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumOwner', as 'Str', where {
    my %options = ('owner' => 1, 'company' => 1);
    return exists $options{$_};
};

coerce 'EnumOwner', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('owner', 'company');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumFlatRate', as 'Str', where {
    my %options = ('flat rate' => 1, 'percentage' => 1);
    return exists $options{$_};
};

coerce 'EnumFlatRate', from 'Str', via {
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
subtype 'EnumQuarterly', as 'Str', where {
    my %options = ('quarterly' => 1, 'annually' => 1, '90 days' => 1);
    return exists $options{$_};
};

coerce 'EnumQuarterly', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('quarterly', 'annually', '90 days');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumContinuous', as 'Str', where {
    my %options = ('continuous' => 1, 'start/stop' => 1);
    return exists $options{$_};
};

coerce 'EnumContinuous', from 'Str', via {
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
subtype 'EnumPercentage', as 'Str', where {
    my %options = ('percentage' => 1, 'fixed amount' => 1);
    return exists $options{$_};
};

coerce 'EnumPercentage', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('percentage', 'fixed amount');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumYes', as 'Str', where {
    my %options = ('yes' => 1, 'no' => 1);
    return exists $options{$_};
};

coerce 'EnumYes', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('yes', 'no');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumPassed', as 'Str', where {
    my %options = ('passed' => 1, 'failed' => 1, 'postponed' => 1, 'other' => 1);
    return exists $options{$_};
};

coerce 'EnumPassed', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('passed', 'failed', 'postponed', 'other');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumDebit', as 'Str', where {
    my %options = ('debit' => 1, 'credit' => 1);
    return exists $options{$_};
};

coerce 'EnumDebit', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('debit', 'credit');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumStandard', as 'Str', where {
    my %options = ('standard' => 1, 'by date' => 1, 'cash' => 1);
    return exists $options{$_};
};

coerce 'EnumStandard', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('standard', 'by date', 'cash');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumCompanyCarrier', as 'Str', where {
    my %options = ('company carrier' => 1, 'brokerage only' => 1);
    return exists $options{$_};
};

coerce 'EnumCompanyCarrier', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('company carrier', 'brokerage only');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'SetVoice', as 'Str', where {
    my %options = ('voice' => 1, 'sms' => 1, 'mms' => 1, 'fax' => 1);
    return scalar(grep { not exists $options{$_} } split(/,/, $_)) == 0;
};

coerce 'SetVoice', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('voice', 'sms', 'mms', 'fax');
        return join(',', rand_set(set => \@list, min => 1, max => scalar(@list), shuffle => 1));
    } else {
        join(',', map { s/(^\s+|\s+$)//g; s/\s+/ /g; lc($_) } split(',', $_));
    }
};

coerce 'SetVoice', from 'HashRef', via {
    my @list   = ('voice', 'sms', 'mms', 'fax');
    my %posted = map { lc($_), 1 } keys %$_;
    join(',', grep {defined} map { exists $posted{$_} ? $_ : undef } @list);
};

# ............................................................................
subtype 'EnumLoan', as 'Str', where {
    my %options = ('loan' => 1, 'one-time charge' => 1, 'recurring charge' => 1);
    return exists $options{$_};
};

coerce 'EnumLoan', from 'Str', via {
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
subtype 'EnumHourly', as 'Str', where {
    my %options = (
        'hourly'          => 1,
        'salary'          => 1,
        'weekly'          => 1,
        'biweekly'        => 1,
        'monthly'         => 1,
        'mileage'         => 1,
        'load percentage' => 1,
        'flat rate'       => 1
    );
    return exists $options{$_};
};

coerce 'EnumHourly', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('hourly', 'salary', 'weekly', 'biweekly', 'monthly', 'mileage', 'load percentage', 'flat rate');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumNa', as 'Str', where {
    my %options = ('na' => 1, 'ok' => 1, 'repair' => 1);
    return exists $options{$_};
};

coerce 'EnumNa', from 'Str', via {
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
subtype 'EnumOnDuty', as 'Str', where {
    my %options = ('on duty' => 1, 'off duty' => 1, 'driving' => 1, 'sleeping' => 1);
    return exists $options{$_};
};

coerce 'EnumOnDuty', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('on duty', 'off duty', 'driving', 'sleeping');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumSsn', as 'Str', where {
    my %options = ('ssn' => 1, 'ein' => 1, 'itin' => 1);
    return exists $options{$_};
};

coerce 'EnumSsn', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('ssn', 'ein', 'itin');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumDoNotUse', as 'Str', where {
    my %options = ('do not use' => 1, 'can use' => 1);
    return exists $options{$_};
};

coerce 'EnumDoNotUse', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('do not use', 'can use');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumSingle', as 'Str', where {
    my %options = ('single' => 1, 'married' => 1, 'widowed' => 1, 'divorsed' => 1);
    return exists $options{$_};
};

coerce 'EnumSingle', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('single', 'married', 'widowed', 'divorsed');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'SetTruck', as 'Str', where {
    my %options = ('truck' => 1, 'trailer' => 1, 'sprinter' => 1);
    return scalar(grep { not exists $options{$_} } split(/,/, $_)) == 0;
};

coerce 'SetTruck', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('truck', 'trailer', 'sprinter');
        return join(',', rand_set(set => \@list, min => 1, max => scalar(@list), shuffle => 1));
    } else {
        join(',', map { s/(^\s+|\s+$)//g; s/\s+/ /g; lc($_) } split(',', $_));
    }
};

coerce 'SetTruck', from 'HashRef', via {
    my @list   = ('voice', 'sms', 'mms', 'fax');
    my %posted = map { lc($_), 1 } keys %$_;
    join(',', grep {defined} map { exists $posted{$_} ? $_ : undef } @list);
};

# ............................................................................
subtype 'EnumNone', as 'Str', where {
    my %options = ('none' => 1, 'deisel' => 1, 'unleaded' => 1);
    return exists $options{$_};
};

coerce 'EnumNone', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('none', 'deisel', 'unleaded');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumCustomer', as 'Str', where {
    my %options = ('customer' => 1, 'vendor' => 1);
    return exists $options{$_};
};

coerce 'EnumCustomer', from 'Str', via {
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
subtype 'EnumPending', as 'Str', where {
    my %options = ('pending' => 1, 'dispatched' => 1, 'complete' => 1, 'other' => 1, 'tonu' => 1, 'cancelled' => 1);
    return exists $options{$_};
};

coerce 'EnumPending', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('pending', 'dispatched', 'complete', 'other', 'tonu', 'cancelled');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumMale', as 'Str', where {
    my %options = ('male' => 1, 'female' => 1);
    return exists $options{$_};
};

coerce 'EnumMale', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('male', 'female');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumAppointment', as 'Str', where {
    my %options = ('appointment' => 1, 'time open' => 1);
    return exists $options{$_};
};

coerce 'EnumAppointment', from 'Str', via {
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
subtype 'EnumMember', as 'Str', where {
    my %options = ('member' => 1, 'vise' => 1, 'executive' => 1);
    return exists $options{$_};
};

coerce 'EnumMember', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('member', 'vise', 'executive');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

# ............................................................................
subtype 'EnumPickup', as 'Str', where {
    my %options = ('pickup' => 1, 'dropoff' => 1);
    return exists $options{$_};
};

coerce 'EnumPickup', from 'Str', via {
    if ($AUTO_GENERATE) {
        my @list = ('pickup', 'dropoff');
        return rand_enum(set => \@list);
    } else {
        s/(^\s+|\s+$)//g;
        s/\s+/ /g;
        return (lc($_));
    }
};

#AUTO-GENERATED

1;

