package TMS::API::Types::Objects;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Date::Manip;

use Moose::Util::TypeConstraints;

our $AUTO_GENERATE = 0;

# ............................................................................
subtype 'BizCompanyNodeObj', as class_type('TMS::API::Core::BizCompanyNode');
coerce 'BizCompanyNodeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ParentId' => ' ',
            'NodeId'   => undef,
            'UnitName' => ' ',
            'Type'     => ' '
        };
        return TMS::Test::Core::BizCompanyNode->new(%$TheDefault);
    }
    return TMS::API::Core::BizCompanyNode->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ParentId' => ' ',
            'NodeId'   => undef,
            'UnitName' => ' ',
            'Type'     => ' '
        };
        return TMS::Test::Core::BizCompanyNode->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinTransactionTypeObj', as class_type('TMS::API::Core::FinTransactionType');
coerce 'FinTransactionTypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'TransTypeName' => ' ',
            'TransTypeId'   => undef
        };
        return TMS::Test::Core::FinTransactionType->new(%$TheDefault);
    }
    return TMS::API::Core::FinTransactionType->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'TransTypeName' => ' ',
            'TransTypeId'   => undef
        };
        return TMS::Test::Core::FinTransactionType->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvSupportVendorObj', as class_type('TMS::API::Core::InvSupportVendor');
coerce 'InvSupportVendorObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Name'           => ' ',
            'SupportId'      => undef,
            'PrimaryContact' => ' ',
            'VendorId'       => ' ',
            'Description'    => ' '
        };
        return TMS::Test::Core::InvSupportVendor->new(%$TheDefault);
    }
    return TMS::API::Core::InvSupportVendor->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Name'           => ' ',
            'SupportId'      => undef,
            'PrimaryContact' => ' ',
            'VendorId'       => ' ',
            'Description'    => ' '
        };
        return TMS::Test::Core::InvSupportVendor->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinItemTemplatesTypeObj', as class_type('TMS::API::Core::FinItemTemplatesType');
coerce 'FinItemTemplatesTypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Name'           => ' ',
            'TemplateTypeId' => undef,
            'DisplayToUser'  => ' ',
            'Description'    => ' ',
            'UserDefined'    => ' '
        };
        return TMS::Test::Core::FinItemTemplatesType->new(%$TheDefault);
    }
    return TMS::API::Core::FinItemTemplatesType->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Name'           => ' ',
            'TemplateTypeId' => undef,
            'DisplayToUser'  => ' ',
            'Description'    => ' ',
            'UserDefined'    => ' '
        };
        return TMS::Test::Core::FinItemTemplatesType->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftVehicleInspectionObj', as class_type('TMS::API::Core::SftVehicleInspection');
coerce 'SftVehicleInspectionObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspectorId'          => ' ',
            'Remarks'              => ' ',
            'LocationOfRecords'    => ' ',
            'Mileage'              => ' ',
            'Status'               => ' ',
            'DateInspection'       => ' ',
            'InspectionScheduleId' => ' ',
            'InspectionId'         => undef,
            'InspectorSignatureId' => ' ',
            'InspectionNumber'     => ' '
        };
        return TMS::Test::Core::SftVehicleInspection->new(%$TheDefault);
    }
    return TMS::API::Core::SftVehicleInspection->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspectorId'          => ' ',
            'Remarks'              => ' ',
            'LocationOfRecords'    => ' ',
            'Mileage'              => ' ',
            'Status'               => ' ',
            'DateInspection'       => ' ',
            'InspectionScheduleId' => ' ',
            'InspectionId'         => undef,
            'InspectorSignatureId' => ' ',
            'InspectionNumber'     => ' '
        };
        return TMS::Test::Core::SftVehicleInspection->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftVehicleInspectItemObj', as class_type('TMS::API::Core::SftVehicleInspectItem');
coerce 'SftVehicleInspectItemObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ItemAreaName' => ' ',
            'Notes'        => ' ',
            'InspItmId'    => undef
        };
        return TMS::Test::Core::SftVehicleInspectItem->new(%$TheDefault);
    }
    return TMS::API::Core::SftVehicleInspectItem->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ItemAreaName' => ' ',
            'Notes'        => ' ',
            'InspItmId'    => undef
        };
        return TMS::Test::Core::SftVehicleInspectItem->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DspTripObj', as class_type('TMS::API::Core::DspTrip');
coerce 'DspTripObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateBooked'     => ' ',
            'TripNumber'     => ' ',
            'GoogleRoute'    => ' ',
            'DateDispatched' => ' ',
            'DateStarted'    => ' ',
            'DateCreated'    => ' ',
            'CreatedBy'      => ' ',
            'IsValid'        => ' ',
            'TripId'         => undef,
            'Notes'          => ' ',
            'TripStatus'     => ' ',
            'DateCompleted'  => ' '
        };
        return TMS::Test::Core::DspTrip->new(%$TheDefault);
    }
    return TMS::API::Core::DspTrip->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateBooked'     => ' ',
            'TripNumber'     => ' ',
            'GoogleRoute'    => ' ',
            'DateDispatched' => ' ',
            'DateStarted'    => ' ',
            'DateCreated'    => ' ',
            'CreatedBy'      => ' ',
            'IsValid'        => ' ',
            'TripId'         => undef,
            'Notes'          => ' ',
            'TripStatus'     => ' ',
            'DateCompleted'  => ' '
        };
        return TMS::Test::Core::DspTrip->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DspLoadsDestinationObj', as class_type('TMS::API::Core::DspLoadsDestination');
coerce 'DspLoadsDestinationObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PU_PO'            => ' ',
            'DestinationId'    => undef,
            'AppointmentNotes' => ' ',
            'Pallets'          => ' ',
            'AppointmentStart' => ' ',
            'AppointmentEnd'   => ' ',
            'Weight'           => ' ',
            'StopOrder'        => ' ',
            'Branch'           => ' ',
            'Pieces'           => ' ',
            'Commodity'        => ' ',
            'StopType'         => ' ',
            'LoadId'           => ' ',
            'AppointmentType'  => ' '
        };
        return TMS::Test::Core::DspLoadsDestination->new(%$TheDefault);
    }
    return TMS::API::Core::DspLoadsDestination->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PU_PO'            => ' ',
            'DestinationId'    => undef,
            'AppointmentNotes' => ' ',
            'Pallets'          => ' ',
            'AppointmentStart' => ' ',
            'AppointmentEnd'   => ' ',
            'Weight'           => ' ',
            'StopOrder'        => ' ',
            'Branch'           => ' ',
            'Pieces'           => ' ',
            'Commodity'        => ' ',
            'StopType'         => ' ',
            'LoadId'           => ' ',
            'AppointmentType'  => ' '
        };
        return TMS::Test::Core::DspLoadsDestination->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftElogStatObj', as class_type('TMS::API::Core::SftElogStat');
coerce 'SftElogStatObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Longitude'          => ' ',
            'EquipmentId'        => ' ',
            'Odometer'           => ' ',
            'GpsReqId'           => undef,
            'Latitude'           => ' ',
            'EngineHours'        => ' ',
            'Speed'              => ' ',
            'LocationProviderId' => ' ',
            'Bearings'           => ' ',
            'Fuel'               => ' ',
            'Acquired'           => ' ',
            'Posted'             => ' ',
            'VehicleState'       => ' '
        };
        return TMS::Test::Core::SftElogStat->new(%$TheDefault);
    }
    return TMS::API::Core::SftElogStat->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Longitude'          => ' ',
            'EquipmentId'        => ' ',
            'Odometer'           => ' ',
            'GpsReqId'           => undef,
            'Latitude'           => ' ',
            'EngineHours'        => ' ',
            'Speed'              => ' ',
            'LocationProviderId' => ' ',
            'Bearings'           => ' ',
            'Fuel'               => ' ',
            'Acquired'           => ' ',
            'Posted'             => ' ',
            'VehicleState'       => ' '
        };
        return TMS::Test::Core::SftElogStat->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvVehicleObj', as class_type('TMS::API::Core::InvVehicle');
coerce 'InvVehicleObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Color'         => ' ',
            'Length'        => ' ',
            'Width'         => ' ',
            'UnladenWeight' => ' ',
            'TireSize'      => ' ',
            'CarrierId'     => ' ',
            'Model'         => ' ',
            'VIN'           => ' ',
            'Make'          => ' ',
            'Fuel'          => ' ',
            'VehicleId'     => undef,
            'Axels'         => ' ',
            'Year'          => ' ',
            'Height'        => ' '
        };
        return TMS::Test::Core::InvVehicle->new(%$TheDefault);
    }
    return TMS::API::Core::InvVehicle->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Color'         => ' ',
            'Length'        => ' ',
            'Width'         => ' ',
            'UnladenWeight' => ' ',
            'TireSize'      => ' ',
            'CarrierId'     => ' ',
            'Model'         => ' ',
            'VIN'           => ' ',
            'Make'          => ' ',
            'Fuel'          => ' ',
            'VehicleId'     => undef,
            'Axels'         => ' ',
            'Year'          => ' ',
            'Height'        => ' '
        };
        return TMS::Test::Core::InvVehicle->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftVehicleInspectedItemObj', as class_type('TMS::API::Core::SftVehicleInspectedItem');
coerce 'SftVehicleInspectedItemObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspectedItem' => ' ',
            'InspectedDate' => ' ',
            'InspectedId'   => undef,
            'InspectionId'  => ' ',
            'Status'        => ' '
        };
        return TMS::Test::Core::SftVehicleInspectedItem->new(%$TheDefault);
    }
    return TMS::API::Core::SftVehicleInspectedItem->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspectedItem' => ' ',
            'InspectedDate' => ' ',
            'InspectedId'   => undef,
            'InspectionId'  => ' ',
            'Status'        => ' '
        };
        return TMS::Test::Core::SftVehicleInspectedItem->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'CmmPackageObj', as class_type('TMS::API::Core::CmmPackage');
coerce 'CmmPackageObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'Name' => undef};
        return TMS::Test::Core::CmmPackage->new(%$TheDefault);
    }
    return TMS::API::Core::CmmPackage->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'Name' => undef};
        return TMS::Test::Core::CmmPackage->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinChequeObj', as class_type('TMS::API::Core::FinCheque');
coerce 'FinChequeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Memo'               => ' ',
            'CreatedBy'          => ' ',
            'PayerPhone'         => ' ',
            'BankRoutingNumber'  => ' ',
            'Payee'              => ' ',
            'PayeeCityAddress'   => ' ',
            'PayerName'          => ' ',
            'DateCreated'        => ' ',
            'ChequeId'           => undef,
            'PayerStreetAddress' => ' ',
            'VoidedBy'           => ' ',
            'DateVoided'         => ' ',
            'Amount'             => ' ',
            'Payer'              => ' ',
            'AuthorizedBy'       => ' ',
            'PayeeName'          => ' ',
            'PayerCityAddress'   => ' ',
            'PayeeStreetAddress' => ' ',
            'BankCityAddress'    => ' ',
            'BankPhone'          => ' ',
            'BankStreetAddress'  => ' ',
            'ChequeNumber'       => ' ',
            'TransactionId'      => ' ',
            'BankAccountNumber'  => ' ',
            'Bank'               => ' ',
            'BankName'           => ' ',
            'PayeePhone'         => ' ',
            'DateAuthorized'     => ' '
        };
        return TMS::Test::Core::FinCheque->new(%$TheDefault);
    }
    return TMS::API::Core::FinCheque->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Memo'               => ' ',
            'CreatedBy'          => ' ',
            'PayerPhone'         => ' ',
            'BankRoutingNumber'  => ' ',
            'Payee'              => ' ',
            'PayeeCityAddress'   => ' ',
            'PayerName'          => ' ',
            'DateCreated'        => ' ',
            'ChequeId'           => undef,
            'PayerStreetAddress' => ' ',
            'VoidedBy'           => ' ',
            'DateVoided'         => ' ',
            'Amount'             => ' ',
            'Payer'              => ' ',
            'AuthorizedBy'       => ' ',
            'PayeeName'          => ' ',
            'PayerCityAddress'   => ' ',
            'PayeeStreetAddress' => ' ',
            'BankCityAddress'    => ' ',
            'BankPhone'          => ' ',
            'BankStreetAddress'  => ' ',
            'ChequeNumber'       => ' ',
            'TransactionId'      => ' ',
            'BankAccountNumber'  => ' ',
            'Bank'               => ' ',
            'BankName'           => ' ',
            'PayeePhone'         => ' ',
            'DateAuthorized'     => ' '
        };
        return TMS::Test::Core::FinCheque->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvEquipmentObj', as class_type('TMS::API::Core::InvEquipment');
coerce 'InvEquipmentObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateSold'       => ' ',
            'VendorId'       => ' ',
            'SerialNo'       => ' ',
            'GeneralName'    => ' ',
            'DatePurchased'  => ' ',
            'OwnerId'        => ' ',
            'PriceSold'      => ' ',
            'EquipmentId'    => undef,
            'PricePurchased' => ' '
        };
        return TMS::Test::Core::InvEquipment->new(%$TheDefault);
    }
    return TMS::API::Core::InvEquipment->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateSold'       => ' ',
            'VendorId'       => ' ',
            'SerialNo'       => ' ',
            'GeneralName'    => ' ',
            'DatePurchased'  => ' ',
            'OwnerId'        => ' ',
            'PriceSold'      => ' ',
            'EquipmentId'    => undef,
            'PricePurchased' => ' '
        };
        return TMS::Test::Core::InvEquipment->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DspLoadObj', as class_type('TMS::API::Core::DspLoad');
coerce 'DspLoadObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'TempMode'       => ' ',
            'BrokerId'       => ' ',
            'ProNumber'      => ' ',
            'DateBooked'     => ' ',
            'Job'            => ' ',
            'ReeferTempHigh' => ' ',
            'DispatchNote'   => ' ',
            'ReeferTempLow'  => ' ',
            'GoogleRoute'    => ' ',
            'ShipperId'      => ' ',
            'DateCreated'    => ' ',
            'LoadId'         => undef,
            'Precooling'     => ' ',
            'LoadNumber'     => ' ',
            'CreatedBy'      => ' ',
            'LoadType'       => ' ',
            'TeamRequired'   => ' ',
            'BookedBy'       => ' ',
            'TruckType'      => ' '
        };
        return TMS::Test::Core::DspLoad->new(%$TheDefault);
    }
    return TMS::API::Core::DspLoad->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'TempMode'       => ' ',
            'BrokerId'       => ' ',
            'ProNumber'      => ' ',
            'DateBooked'     => ' ',
            'Job'            => ' ',
            'ReeferTempHigh' => ' ',
            'DispatchNote'   => ' ',
            'ReeferTempLow'  => ' ',
            'GoogleRoute'    => ' ',
            'ShipperId'      => ' ',
            'DateCreated'    => ' ',
            'LoadId'         => undef,
            'Precooling'     => ' ',
            'LoadNumber'     => ' ',
            'CreatedBy'      => ' ',
            'LoadType'       => ' ',
            'TeamRequired'   => ' ',
            'BookedBy'       => ' ',
            'TruckType'      => ' '
        };
        return TMS::Test::Core::DspLoad->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinAccountTypeObj', as class_type('TMS::API::Core::FinAccountType');
coerce 'FinAccountTypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Name'          => ' ',
            'Temp'          => ' ',
            'UserDefined'   => ' ',
            'Debit'         => ' ',
            'Editable'      => ' ',
            'ParentId'      => ' ',
            'Credit'        => ' ',
            'IncomeSheet'   => ' ',
            'Valid'         => ' ',
            'AccountTypeId' => undef,
            'DisplayOrder'  => ' ',
            'BalanceSheet'  => ' '
        };
        return TMS::Test::Core::FinAccountType->new(%$TheDefault);
    }
    return TMS::API::Core::FinAccountType->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Name'          => ' ',
            'Temp'          => ' ',
            'UserDefined'   => ' ',
            'Debit'         => ' ',
            'Editable'      => ' ',
            'ParentId'      => ' ',
            'Credit'        => ' ',
            'IncomeSheet'   => ' ',
            'Valid'         => ' ',
            'AccountTypeId' => undef,
            'DisplayOrder'  => ' ',
            'BalanceSheet'  => ' '
        };
        return TMS::Test::Core::FinAccountType->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinAccountObj', as class_type('TMS::API::Core::FinAccount');
coerce 'FinAccountObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AccountTypeId' => ' ',
            'ExternalName'  => ' ',
            'DateCreated'   => ' ',
            'ParentId'      => ' ',
            'AccountId'     => undef,
            'Balance'       => ' ',
            'Active'        => ' ',
            'Name'          => ' ',
            'Code'          => ' ',
            'UserDefined'   => ' ',
            'Description'   => ' ',
            'Valid'         => ' '
        };
        return TMS::Test::Core::FinAccount->new(%$TheDefault);
    }
    return TMS::API::Core::FinAccount->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AccountTypeId' => ' ',
            'ExternalName'  => ' ',
            'DateCreated'   => ' ',
            'ParentId'      => ' ',
            'AccountId'     => undef,
            'Balance'       => ' ',
            'Active'        => ' ',
            'Name'          => ' ',
            'Code'          => ' ',
            'UserDefined'   => ' ',
            'Description'   => ' ',
            'Valid'         => ' '
        };
        return TMS::Test::Core::FinAccount->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppAccountObj', as class_type('TMS::API::Core::AppAccount');
coerce 'AppAccountObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated'  => ' ',
            'Locked'       => ' ',
            'Username'     => ' ',
            'AppAccountId' => undef,
            'PasswordHash' => ' ',
            'UserId'       => ' ',
            'Salt'         => ' '
        };
        return TMS::Test::Core::AppAccount->new(%$TheDefault);
    }
    return TMS::API::Core::AppAccount->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated'  => ' ',
            'Locked'       => ' ',
            'Username'     => ' ',
            'AppAccountId' => undef,
            'PasswordHash' => ' ',
            'UserId'       => ' ',
            'Salt'         => ' '
        };
        return TMS::Test::Core::AppAccount->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'TmpRelationsNodeObj', as class_type('TMS::API::Core::TmpRelationsNode');
coerce 'TmpRelationsNodeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ParentId'  => ' ',
            'Name'      => ' ',
            'RelNodeId' => undef
        };
        return TMS::Test::Core::TmpRelationsNode->new(%$TheDefault);
    }
    return TMS::API::Core::TmpRelationsNode->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ParentId'  => ' ',
            'Name'      => ' ',
            'RelNodeId' => undef
        };
        return TMS::Test::Core::TmpRelationsNode->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'GenFileObj', as class_type('TMS::API::Core::GenFile');
coerce 'GenFileObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'MIMEType'      => ' ',
            'SHASIG'        => ' ',
            'FileData'      => ' ',
            'Notes'         => ' ',
            'ExpiredDate'   => ' ',
            'DocumentTitle' => ' ',
            'UploadDate'    => ' ',
            'FileId'        => undef,
            'FileName'      => ' ',
            'Keywords'      => ' '
        };
        return TMS::Test::Core::GenFile->new(%$TheDefault);
    }
    return TMS::API::Core::GenFile->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'MIMEType'      => ' ',
            'SHASIG'        => ' ',
            'FileData'      => ' ',
            'Notes'         => ' ',
            'ExpiredDate'   => ' ',
            'DocumentTitle' => ' ',
            'UploadDate'    => ' ',
            'FileId'        => undef,
            'FileName'      => ' ',
            'Keywords'      => ' '
        };
        return TMS::Test::Core::GenFile->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntityObj', as class_type('TMS::API::Core::Entity');
coerce 'EntityObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BusinessId'  => ' ',
            'DateCreated' => ' ',
            'Notes'       => ' ',
            'EntityId'    => undef,
            'IsActive'    => ' ',
            'PersonId'    => ' '
        };
        return TMS::Test::Core::Entity->new(%$TheDefault);
    }
    return TMS::API::Core::Entity->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BusinessId'  => ' ',
            'DateCreated' => ' ',
            'Notes'       => ' ',
            'EntityId'    => undef,
            'IsActive'    => ' ',
            'PersonId'    => ' '
        };
        return TMS::Test::Core::Entity->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinItemTemplateObj', as class_type('TMS::API::Core::FinItemTemplate');
coerce 'FinItemTemplateObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ParentId'        => ' ',
            'DateCreated'     => ' ',
            'ItemTemplateId'  => undef,
            'Deleted'         => ' ',
            'Description'     => ' ',
            'UserDefined'     => ' ',
            'Name'            => ' ',
            'TemplateTypeId'  => ' ',
            'PriceType'       => ' ',
            'UpdatedBy'       => ' ',
            'CreditAccountId' => ' ',
            'DebitAccountId'  => ' ',
            'TransactionType' => ' ',
            'Price'           => ' ',
            'DateUpdated'     => ' ',
            'DateDeleted'     => ' ',
            'CreatedBy'       => ' ',
            'DeletedBy'       => ' ',
            'EntityId'        => ' '
        };
        return TMS::Test::Core::FinItemTemplate->new(%$TheDefault);
    }
    return TMS::API::Core::FinItemTemplate->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ParentId'        => ' ',
            'DateCreated'     => ' ',
            'ItemTemplateId'  => undef,
            'Deleted'         => ' ',
            'Description'     => ' ',
            'UserDefined'     => ' ',
            'Name'            => ' ',
            'TemplateTypeId'  => ' ',
            'PriceType'       => ' ',
            'UpdatedBy'       => ' ',
            'CreditAccountId' => ' ',
            'DebitAccountId'  => ' ',
            'TransactionType' => ' ',
            'Price'           => ' ',
            'DateUpdated'     => ' ',
            'DateDeleted'     => ' ',
            'CreatedBy'       => ' ',
            'DeletedBy'       => ' ',
            'EntityId'        => ' '
        };
        return TMS::Test::Core::FinItemTemplate->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvRoleObj', as class_type('TMS::API::Core::InvRole');
coerce 'InvRoleObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'RoleName'  => ' ',
            'Notes'     => ' ',
            'InvRoleId' => undef
        };
        return TMS::Test::Core::InvRole->new(%$TheDefault);
    }
    return TMS::API::Core::InvRole->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'RoleName'  => ' ',
            'Notes'     => ' ',
            'InvRoleId' => undef
        };
        return TMS::Test::Core::InvRole->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinBillingTagObj', as class_type('TMS::API::Core::FinBillingTag');
coerce 'FinBillingTagObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BillingTag'   => ' ',
            'CreatedBy'    => ' ',
            'DateCreated'  => ' ',
            'UserDefined'  => ' ',
            'BillingTagId' => undef
        };
        return TMS::Test::Core::FinBillingTag->new(%$TheDefault);
    }
    return TMS::API::Core::FinBillingTag->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BillingTag'   => ' ',
            'CreatedBy'    => ' ',
            'DateCreated'  => ' ',
            'UserDefined'  => ' ',
            'BillingTagId' => undef
        };
        return TMS::Test::Core::FinBillingTag->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinClassObj', as class_type('TMS::API::Core::FinClass');
coerce 'FinClassObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ClassId' => undef,
            'Name'    => ' '
        };
        return TMS::Test::Core::FinClass->new(%$TheDefault);
    }
    return TMS::API::Core::FinClass->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ClassId' => undef,
            'Name'    => ' '
        };
        return TMS::Test::Core::FinClass->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntPersonObj', as class_type('TMS::API::Core::EntPerson');
coerce 'EntPersonObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PrsnId'     => undef,
            'BrnchId'    => ' ',
            'Prefix'     => ' ',
            'Suffix'     => ' ',
            'NickName'   => ' ',
            'MiddleName' => ' ',
            'FirstName'  => ' ',
            'LastName'   => ' '
        };
        return TMS::Test::Core::EntPerson->new(%$TheDefault);
    }
    return TMS::API::Core::EntPerson->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PrsnId'     => undef,
            'BrnchId'    => ' ',
            'Prefix'     => ' ',
            'Suffix'     => ' ',
            'NickName'   => ' ',
            'MiddleName' => ' ',
            'FirstName'  => ' ',
            'LastName'   => ' '
        };
        return TMS::Test::Core::EntPerson->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'CntAddressObj', as class_type('TMS::API::Core::CntAddress');
coerce 'CntAddressObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'City'    => ' ',
            'AddrId'  => undef,
            'GpsLng'  => ' ',
            'GpsLat'  => ' ',
            'Notes'   => ' ',
            'Zip'     => ' ',
            'Street3' => ' ',
            'State'   => ' ',
            'Street2' => ' ',
            'Country' => ' ',
            'Street1' => ' '
        };
        return TMS::Test::Core::CntAddress->new(%$TheDefault);
    }
    return TMS::API::Core::CntAddress->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'City'    => ' ',
            'AddrId'  => undef,
            'GpsLng'  => ' ',
            'GpsLat'  => ' ',
            'Notes'   => ' ',
            'Zip'     => ' ',
            'Street3' => ' ',
            'State'   => ' ',
            'Street2' => ' ',
            'Country' => ' ',
            'Street1' => ' '
        };
        return TMS::Test::Core::CntAddress->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvTrailerTypeObj', as class_type('TMS::API::Core::InvTrailerType');
coerce 'InvTrailerTypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'Name' => undef};
        return TMS::Test::Core::InvTrailerType->new(%$TheDefault);
    }
    return TMS::API::Core::InvTrailerType->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'Name' => undef};
        return TMS::Test::Core::InvTrailerType->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DrvDesttypeObj', as class_type('TMS::API::Core::DrvDesttype');
coerce 'DrvDesttypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'         => ' ',
            'DestName'      => ' ',
            'DesiredDestId' => undef
        };
        return TMS::Test::Core::DrvDesttype->new(%$TheDefault);
    }
    return TMS::API::Core::DrvDesttype->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'         => ' ',
            'DestName'      => ' ',
            'DesiredDestId' => undef
        };
        return TMS::Test::Core::DrvDesttype->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinPaymentMethodObj', as class_type('TMS::API::Core::FinPaymentMethod');
coerce 'FinPaymentMethodObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'PaymentMethodId' => undef};
        return TMS::Test::Core::FinPaymentMethod->new(%$TheDefault);
    }
    return TMS::API::Core::FinPaymentMethod->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'PaymentMethodId' => undef};
        return TMS::Test::Core::FinPaymentMethod->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftInspectionScheduleObj', as class_type('TMS::API::Core::SftInspectionSchedule');
coerce 'SftInspectionScheduleObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspectionScheduleId' => undef,
            'VehicleId'            => ' ',
            'InspectionType'       => ' '
        };
        return TMS::Test::Core::SftInspectionSchedule->new(%$TheDefault);
    }
    return TMS::API::Core::SftInspectionSchedule->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspectionScheduleId' => undef,
            'VehicleId'            => ' ',
            'InspectionType'       => ' '
        };
        return TMS::Test::Core::SftInspectionSchedule->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DrvCdlEndorsementObj', as class_type('TMS::API::Core::DrvCdlEndorsement');
coerce 'DrvCdlEndorsementObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Endorsement'   => ' ',
            'EndrsId'       => undef,
            'ExpiredDate'   => ' ',
            'ValidFromDate' => ' '
        };
        return TMS::Test::Core::DrvCdlEndorsement->new(%$TheDefault);
    }
    return TMS::API::Core::DrvCdlEndorsement->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Endorsement'   => ' ',
            'EndrsId'       => undef,
            'ExpiredDate'   => ' ',
            'ValidFromDate' => ' '
        };
        return TMS::Test::Core::DrvCdlEndorsement->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'HrAssociateObj', as class_type('TMS::API::Core::HrAssociate');
coerce 'HrAssociateObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AuthorityLevel' => ' ',
            'DateCreated'    => ' ',
            'CurrentTitle'   => ' ',
            'AstId'          => undef,
            'DateRemoved'    => ' ',
            'BizPhone'       => ' ',
            'Notes'          => ' ',
            'NodeId'         => ' ',
            'BizFax'         => ' ',
            'BizEmail'       => ' '
        };
        return TMS::Test::Core::HrAssociate->new(%$TheDefault);
    }
    return TMS::API::Core::HrAssociate->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AuthorityLevel' => ' ',
            'DateCreated'    => ' ',
            'CurrentTitle'   => ' ',
            'AstId'          => undef,
            'DateRemoved'    => ' ',
            'BizPhone'       => ' ',
            'Notes'          => ' ',
            'NodeId'         => ' ',
            'BizFax'         => ' ',
            'BizEmail'       => ' '
        };
        return TMS::Test::Core::HrAssociate->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntCarrierObj', as class_type('TMS::API::Core::EntCarrier');
coerce 'EntCarrierObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'state_NY'           => ' ',
            'state_NM'           => ' ',
            'McCertificatePhoto' => ' ',
            'DOT'                => ' ',
            'CrType'             => ' ',
            'IFTA_Acc'           => ' ',
            'state_OR'           => ' ',
            'state_SC'           => ' ',
            'IFTA_State'         => ' ',
            'state_KY'           => ' ',
            'CarrierId'          => undef,
            'SCAC'               => ' ',
            'state_FL'           => ' ',
            'state_NC'           => ' ',
            'MC'                 => ' '
        };
        return TMS::Test::Core::EntCarrier->new(%$TheDefault);
    }
    return TMS::API::Core::EntCarrier->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'state_NY'           => ' ',
            'state_NM'           => ' ',
            'McCertificatePhoto' => ' ',
            'DOT'                => ' ',
            'CrType'             => ' ',
            'IFTA_Acc'           => ' ',
            'state_OR'           => ' ',
            'state_SC'           => ' ',
            'IFTA_State'         => ' ',
            'state_KY'           => ' ',
            'CarrierId'          => undef,
            'SCAC'               => ' ',
            'state_FL'           => ' ',
            'state_NC'           => ' ',
            'MC'                 => ' '
        };
        return TMS::Test::Core::EntCarrier->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntBusinessObj', as class_type('TMS::API::Core::EntBusiness');
coerce 'EntBusinessObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'RootNode' => ' ',
            'BizURL'   => ' ',
            'BizName'  => ' ',
            'BizId'    => undef
        };
        return TMS::Test::Core::EntBusiness->new(%$TheDefault);
    }
    return TMS::API::Core::EntBusiness->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'RootNode' => ' ',
            'BizURL'   => ' ',
            'BizName'  => ' ',
            'BizId'    => undef
        };
        return TMS::Test::Core::EntBusiness->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DrvDriverObj', as class_type('TMS::API::Core::DrvDriver');
coerce 'DrvDriverObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InternationalRoutes' => ' ',
            'LastAnnualReview'    => ' ',
            'DriverId'            => undef,
            'LocalRoutes'         => ' ',
            'PullNotice'          => ' '
        };
        return TMS::Test::Core::DrvDriver->new(%$TheDefault);
    }
    return TMS::API::Core::DrvDriver->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InternationalRoutes' => ' ',
            'LastAnnualReview'    => ' ',
            'DriverId'            => undef,
            'LocalRoutes'         => ' ',
            'PullNotice'          => ' '
        };
        return TMS::Test::Core::DrvDriver->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppRoleObj', as class_type('TMS::API::Core::AppRole');
coerce 'AppRoleObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated' => ' ',
            'Editable'    => ' ',
            'UpdatedBy'   => ' ',
            'CreatedBy'   => ' ',
            'UserDefined' => ' ',
            'RoleId'      => undef,
            'DateUpdated' => ' ',
            'RoleName'    => ' ',
            'Description' => ' '
        };
        return TMS::Test::Core::AppRole->new(%$TheDefault);
    }
    return TMS::API::Core::AppRole->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated' => ' ',
            'Editable'    => ' ',
            'UpdatedBy'   => ' ',
            'CreatedBy'   => ' ',
            'UserDefined' => ' ',
            'RoleId'      => undef,
            'DateUpdated' => ' ',
            'RoleName'    => ' ',
            'Description' => ' '
        };
        return TMS::Test::Core::AppRole->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InsPolicyObj', as class_type('TMS::API::Core::InsPolicy');
coerce 'InsPolicyObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PolicyNumber'      => ' ',
            'EffectiveDate'     => ' ',
            'TagName'           => ' ',
            'ExpirationDate'    => ' ',
            'PaidBy'            => ' ',
            'DownpaymentAmount' => ' ',
            'InsId'             => undef,
            'InsuredAmount'     => ' ',
            'WhatIsInsured'     => ' ',
            'ProofOfInsurance'  => ' ',
            'ProviderAgent'     => ' '
        };
        return TMS::Test::Core::InsPolicy->new(%$TheDefault);
    }
    return TMS::API::Core::InsPolicy->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PolicyNumber'      => ' ',
            'EffectiveDate'     => ' ',
            'TagName'           => ' ',
            'ExpirationDate'    => ' ',
            'PaidBy'            => ' ',
            'DownpaymentAmount' => ' ',
            'InsId'             => undef,
            'InsuredAmount'     => ' ',
            'WhatIsInsured'     => ' ',
            'ProofOfInsurance'  => ' ',
            'ProviderAgent'     => ' '
        };
        return TMS::Test::Core::InsPolicy->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinTransactionObj', as class_type('TMS::API::Core::FinTransaction');
coerce 'FinTransactionObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateTransaction' => ' ',
            'DateCreated'     => ' ',
            'Status'          => ' ',
            'RefNumber'       => ' ',
            'TransactionType' => ' ',
            'Memo'            => ' ',
            'TransactionId'   => undef,
            'JobId'           => ' ',
            'CreatedBy'       => ' ',
            'Class'           => ' '
        };
        return TMS::Test::Core::FinTransaction->new(%$TheDefault);
    }
    return TMS::API::Core::FinTransaction->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateTransaction' => ' ',
            'DateCreated'     => ' ',
            'Status'          => ' ',
            'RefNumber'       => ' ',
            'TransactionType' => ' ',
            'Memo'            => ' ',
            'TransactionId'   => undef,
            'JobId'           => ' ',
            'CreatedBy'       => ' ',
            'Class'           => ' '
        };
        return TMS::Test::Core::FinTransaction->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'TskAlrmObj', as class_type('TMS::API::Core::TskAlrm');
coerce 'TskAlrmObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'alrmid'    => undef,
            'repeat'    => ' ',
            'periodic'  => ' ',
            'message'   => ' ',
            'turnoff'   => ' ',
            'atcrontab' => ' ',
            'tskid'     => ' '
        };
        return TMS::Test::Core::TskAlrm->new(%$TheDefault);
    }
    return TMS::API::Core::TskAlrm->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'alrmid'    => undef,
            'repeat'    => ' ',
            'periodic'  => ' ',
            'message'   => ' ',
            'turnoff'   => ' ',
            'atcrontab' => ' ',
            'tskid'     => ' '
        };
        return TMS::Test::Core::TskAlrm->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftLogbookObj', as class_type('TMS::API::Core::SftLogbook');
coerce 'SftLogbookObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'LogbookId'   => undef,
            'Trip'        => ' ',
            'Notes'       => ' ',
            'DateStarted' => ' '
        };
        return TMS::Test::Core::SftLogbook->new(%$TheDefault);
    }
    return TMS::API::Core::SftLogbook->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'LogbookId'   => undef,
            'Trip'        => ' ',
            'Notes'       => ' ',
            'DateStarted' => ' '
        };
        return TMS::Test::Core::SftLogbook->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvUnitObj', as class_type('TMS::API::Core::InvUnit');
coerce 'InvUnitObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'UnitId'  => undef,
            'UnitTag' => ' '
        };
        return TMS::Test::Core::InvUnit->new(%$TheDefault);
    }
    return TMS::API::Core::InvUnit->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'UnitId'  => undef,
            'UnitTag' => ' '
        };
        return TMS::Test::Core::InvUnit->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntCustomerObj', as class_type('TMS::API::Core::EntCustomer');
coerce 'EntCustomerObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'SCAC'             => ' ',
            'Bond'             => ' ',
            'DUNS'             => ' ',
            'WhyDontUse'       => ' ',
            'MC'               => ' ',
            'DontUse'          => ' ',
            'CstmrId'          => undef,
            'DOT'              => ' ',
            'CreditLimit'      => ' ',
            'Factoring'        => ' ',
            'RequireOriginals' => ' ',
            'Terms'            => ' '
        };
        return TMS::Test::Core::EntCustomer->new(%$TheDefault);
    }
    return TMS::API::Core::EntCustomer->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'SCAC'             => ' ',
            'Bond'             => ' ',
            'DUNS'             => ' ',
            'WhyDontUse'       => ' ',
            'MC'               => ' ',
            'DontUse'          => ' ',
            'CstmrId'          => undef,
            'DOT'              => ' ',
            'CreditLimit'      => ' ',
            'Factoring'        => ' ',
            'RequireOriginals' => ' ',
            'Terms'            => ' '
        };
        return TMS::Test::Core::EntCustomer->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinJobObj', as class_type('TMS::API::Core::FinJob');
coerce 'FinJobObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'JobId'      => undef,
            'JobAddedBy' => ' ',
            'JobCreated' => ' ',
            'Title'      => ' '
        };
        return TMS::Test::Core::FinJob->new(%$TheDefault);
    }
    return TMS::API::Core::FinJob->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'JobId'      => undef,
            'JobAddedBy' => ' ',
            'JobCreated' => ' ',
            'Title'      => ' '
        };
        return TMS::Test::Core::FinJob->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinInvoicesItemObj', as class_type('TMS::API::Core::FinInvoicesItem');
coerce 'FinInvoicesItemObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated'          => ' ',
            'ItemTemplateId'       => ' ',
            'InvoiceId'            => ' ',
            'CreditJournalEntryId' => ' ',
            'JobId'                => ' ',
            'Comments'             => ' ',
            'Notes'                => ' ',
            'DebitJournalEntryId'  => ' ',
            'Amount'               => ' ',
            'InvoiceItemId'        => undef,
            'Quantity'             => ' ',
            'CreatedBy'            => ' '
        };
        return TMS::Test::Core::FinInvoicesItem->new(%$TheDefault);
    }
    return TMS::API::Core::FinInvoicesItem->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated'          => ' ',
            'ItemTemplateId'       => ' ',
            'InvoiceId'            => ' ',
            'CreditJournalEntryId' => ' ',
            'JobId'                => ' ',
            'Comments'             => ' ',
            'Notes'                => ' ',
            'DebitJournalEntryId'  => ' ',
            'Amount'               => ' ',
            'InvoiceItemId'        => undef,
            'Quantity'             => ' ',
            'CreatedBy'            => ' '
        };
        return TMS::Test::Core::FinInvoicesItem->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'CntPhonesfaxObj', as class_type('TMS::API::Core::CntPhonesfax');
coerce 'CntPhonesfaxObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'     => ' ',
            'Number'    => ' ',
            'Mobility'  => ' ',
            'Features'  => ' ',
            'PhnFaxId'  => undef,
            'Extension' => ' '
        };
        return TMS::Test::Core::CntPhonesfax->new(%$TheDefault);
    }
    return TMS::API::Core::CntPhonesfax->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'     => ' ',
            'Number'    => ' ',
            'Mobility'  => ' ',
            'Features'  => ' ',
            'PhnFaxId'  => undef,
            'Extension' => ' '
        };
        return TMS::Test::Core::CntPhonesfax->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'TskActnObj', as class_type('TMS::API::Core::TskActn');
coerce 'TskActnObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'tskid'  => ' ',
            'actid'  => undef,
            'note'   => ' ',
            'PrsnId' => ' '
        };
        return TMS::Test::Core::TskActn->new(%$TheDefault);
    }
    return TMS::API::Core::TskActn->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'tskid'  => ' ',
            'actid'  => undef,
            'note'   => ' ',
            'PrsnId' => ' '
        };
        return TMS::Test::Core::TskActn->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinInvoicePaymentObj', as class_type('TMS::API::Core::FinInvoicePayment');
coerce 'FinInvoicePaymentObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InvoiceId'        => ' ',
            'PayerId'          => ' ',
            'PaymentMethodId'  => ' ',
            'DateCreated'      => ' ',
            'InvoicePaymentId' => undef,
            'DatePayment'      => ' ',
            'Valid'            => ' ',
            'CreatedBy'        => ' ',
            'TransactionId'    => ' ',
            'Amount'           => ' '
        };
        return TMS::Test::Core::FinInvoicePayment->new(%$TheDefault);
    }
    return TMS::API::Core::FinInvoicePayment->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InvoiceId'        => ' ',
            'PayerId'          => ' ',
            'PaymentMethodId'  => ' ',
            'DateCreated'      => ' ',
            'InvoicePaymentId' => undef,
            'DatePayment'      => ' ',
            'Valid'            => ' ',
            'CreatedBy'        => ' ',
            'TransactionId'    => ' ',
            'Amount'           => ' '
        };
        return TMS::Test::Core::FinInvoicePayment->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppFeatureObj', as class_type('TMS::API::Core::AppFeature');
coerce 'AppFeatureObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'        => ' ',
            'Name'         => ' ',
            'AppFeatureId' => undef
        };
        return TMS::Test::Core::AppFeature->new(%$TheDefault);
    }
    return TMS::API::Core::AppFeature->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'        => ' ',
            'Name'         => ' ',
            'AppFeatureId' => undef
        };
        return TMS::Test::Core::AppFeature->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppMenuItemObj', as class_type('TMS::API::Core::AppMenuItem');
coerce 'AppMenuItemObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Enabled'    => ' ',
            'Target'     => ' ',
            'Label'      => ' ',
            'Help'       => ' ',
            'ParentId'   => ' ',
            'MenuItemId' => undef,
            'SortIndex'  => ' ',
            'Icon'       => ' ',
            'Route'      => ' ',
            'Title'      => ' '
        };
        return TMS::Test::Core::AppMenuItem->new(%$TheDefault);
    }
    return TMS::API::Core::AppMenuItem->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Enabled'    => ' ',
            'Target'     => ' ',
            'Label'      => ' ',
            'Help'       => ' ',
            'ParentId'   => ' ',
            'MenuItemId' => undef,
            'SortIndex'  => ' ',
            'Icon'       => ' ',
            'Route'      => ' ',
            'Title'      => ' '
        };
        return TMS::Test::Core::AppMenuItem->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinInvoiceObj', as class_type('TMS::API::Core::FinInvoice');
coerce 'FinInvoiceObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'RefNumber'      => ' ',
            'Notes'          => ' ',
            'DateInvoiced'   => ' ',
            'Comments'       => ' ',
            'InvoiceId'      => undef,
            'Status'         => ' ',
            'DateCreated'    => ' ',
            'PONumber'       => ' ',
            'EntityId'       => ' ',
            'PaymentTermsId' => ' ',
            'FactoredParent' => ' '
        };
        return TMS::Test::Core::FinInvoice->new(%$TheDefault);
    }
    return TMS::API::Core::FinInvoice->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'RefNumber'      => ' ',
            'Notes'          => ' ',
            'DateInvoiced'   => ' ',
            'Comments'       => ' ',
            'InvoiceId'      => undef,
            'Status'         => ' ',
            'DateCreated'    => ' ',
            'PONumber'       => ' ',
            'EntityId'       => ' ',
            'PaymentTermsId' => ' ',
            'FactoredParent' => ' '
        };
        return TMS::Test::Core::FinInvoice->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvTiresizeObj', as class_type('TMS::API::Core::InvTiresize');
coerce 'InvTiresizeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Type'   => ' ',
            'TireId' => undef,
            'Name'   => ' '
        };
        return TMS::Test::Core::InvTiresize->new(%$TheDefault);
    }
    return TMS::API::Core::InvTiresize->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Type'   => ' ',
            'TireId' => undef,
            'Name'   => ' '
        };
        return TMS::Test::Core::InvTiresize->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppPermissionObj', as class_type('TMS::API::Core::AppPermission');
coerce 'AppPermissionObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AccessName'   => ' ',
            'PermissionId' => undef,
            'Feature'      => ' '
        };
        return TMS::Test::Core::AppPermission->new(%$TheDefault);
    }
    return TMS::API::Core::AppPermission->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AccessName'   => ' ',
            'PermissionId' => undef,
            'Feature'      => ' '
        };
        return TMS::Test::Core::AppPermission->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinJournalEntryObj', as class_type('TMS::API::Core::FinJournalEntry');
coerce 'FinJournalEntryObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ReportAmount'   => ' ',
            'DebitCredit'    => ' ',
            'VendorAmount'   => ' ',
            'AccountId'      => ' ',
            'DateCreated'    => ' ',
            'JrlEntryId'     => undef,
            'Amount'         => ' ',
            'EntityId'       => ' ',
            'Classification' => ' ',
            'CreatedBy'      => ' ',
            'JobId'          => ' ',
            'TransactionId'  => ' '
        };
        return TMS::Test::Core::FinJournalEntry->new(%$TheDefault);
    }
    return TMS::API::Core::FinJournalEntry->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ReportAmount'   => ' ',
            'DebitCredit'    => ' ',
            'VendorAmount'   => ' ',
            'AccountId'      => ' ',
            'DateCreated'    => ' ',
            'JrlEntryId'     => undef,
            'Amount'         => ' ',
            'EntityId'       => ' ',
            'Classification' => ' ',
            'CreatedBy'      => ' ',
            'JobId'          => ' ',
            'TransactionId'  => ' '
        };
        return TMS::Test::Core::FinJournalEntry->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'HrGovidcardObj', as class_type('TMS::API::Core::HrGovidcard');
coerce 'HrGovidcardObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'CardDateExpired' => ' ',
            'CardSate'        => ' ',
            'CardId'          => undef,
            'AddedBy'         => ' ',
            'Photo'           => ' ',
            'CardType'        => ' ',
            'CardDateValid'   => ' ',
            'AstId'           => ' ',
            'CardNumber'      => ' '
        };
        return TMS::Test::Core::HrGovidcard->new(%$TheDefault);
    }
    return TMS::API::Core::HrGovidcard->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'CardDateExpired' => ' ',
            'CardSate'        => ' ',
            'CardId'          => undef,
            'AddedBy'         => ' ',
            'Photo'           => ' ',
            'CardType'        => ' ',
            'CardDateValid'   => ' ',
            'AstId'           => ' ',
            'CardNumber'      => ' '
        };
        return TMS::Test::Core::HrGovidcard->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinPaymentTermObj', as class_type('TMS::API::Core::FinPaymentTerm');
coerce 'FinPaymentTermObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DiscountPercent' => ' ',
            'DiscountInDays'  => ' ',
            'Name'            => ' ',
            'DiscountAmount'  => ' ',
            'DueNext'         => ' ',
            'DueInDays'       => ' ',
            'Type'            => ' ',
            'PaymentTermId'   => undef
        };
        return TMS::Test::Core::FinPaymentTerm->new(%$TheDefault);
    }
    return TMS::API::Core::FinPaymentTerm->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DiscountPercent' => ' ',
            'DiscountInDays'  => ' ',
            'Name'            => ' ',
            'DiscountAmount'  => ' ',
            'DueNext'         => ' ',
            'DueInDays'       => ' ',
            'Type'            => ' ',
            'PaymentTermId'   => undef
        };
        return TMS::Test::Core::FinPaymentTerm->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'BizBranchObj', as class_type('TMS::API::Core::BizBranch');
coerce 'BizBranchObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BrnchEMail'   => ' ',
            'BrnchAddress' => ' ',
            'BrnchId'      => undef,
            'BrnchFax'     => ' ',
            'BrnchPhone'   => ' ',
            'BizId'        => ' ',
            'OfficeName'   => ' '
        };
        return TMS::Test::Core::BizBranch->new(%$TheDefault);
    }
    return TMS::API::Core::BizBranch->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BrnchEMail'   => ' ',
            'BrnchAddress' => ' ',
            'BrnchId'      => undef,
            'BrnchFax'     => ' ',
            'BrnchPhone'   => ' ',
            'BizId'        => ' ',
            'OfficeName'   => ' '
        };
        return TMS::Test::Core::BizBranch->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntShipperObj', as class_type('TMS::API::Core::EntShipper');
coerce 'EntShipperObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'     => ' ',
            'ShipperId' => undef
        };
        return TMS::Test::Core::EntShipper->new(%$TheDefault);
    }
    return TMS::API::Core::EntShipper->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'     => ' ',
            'ShipperId' => undef
        };
        return TMS::Test::Core::EntShipper->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'TskTaskObj', as class_type('TMS::API::Core::TskTask');
coerce 'TskTaskObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'duedate'   => ' ',
            'startdate' => ' ',
            'severity'  => ' ',
            'created'   => ' ',
            'estimated' => ' ',
            'completed' => ' ',
            'prjid'     => ' ',
            'tskid'     => undef,
            'priority'  => ' ',
            'PrsnId'    => ' ',
            'name'      => ' '
        };
        return TMS::Test::Core::TskTask->new(%$TheDefault);
    }
    return TMS::API::Core::TskTask->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'duedate'   => ' ',
            'startdate' => ' ',
            'severity'  => ' ',
            'created'   => ' ',
            'estimated' => ' ',
            'completed' => ' ',
            'prjid'     => ' ',
            'tskid'     => undef,
            'priority'  => ' ',
            'PrsnId'    => ' ',
            'name'      => ' '
        };
        return TMS::Test::Core::TskTask->new(%$TheDefault);
    }
    return $_;
};

1;

