class CarrierFormService extends GenericService {
  constructor(http) {
    super(http);
  }

  SubmitForm(data){
    return this.Request('post','api/carrier/create',data,undefined, function(res){
      console.log(res.status);
    });
  }

  BuildObject(object) {
    let dbobj = {};

    dbobj.TD = [];
    dbobj.TH = [];
    dbobj.TG = [];
    for (let acc in object.agent){

    }



    return {
      "TA": {
        "AppAccountId": null,
        "UserId": null,
        "PasswordHash": null,
        "Salt": null,
        "Username": null
      },
      "TB": {
        "BrnchId": null,
        "OfficeName": null,
        "BizId": {
          "BizId": null,
          "BizName": null,
          "BizURL": null
        },
        "BrnchAddress": {
          "AddrId": null,
          "Street1": null,
          "Street2": null,
          "Street3": null,
          "City": null,
          "State": null,
          "Zip": null,
          "Country": null,
          "GpsLng": null,
          "GpsLat": null,
          "Notes": null
        },
        "BrnchPhone": {
          "PhnFaxId": null,
          "Number": null,
          "Extension": null,
          "Features": null,
          "Mobility": null,
          "Notes": null
        },
        "BrnchFax": {
          "PhnFaxId": null,
          "Number": null,
          "Extension": null,
          "Features": null,
          "Mobility": null,
          "Notes": null
        },
        "BrnchEMail": null
      },
      "TC": {
        "IftaAcctId": null,
        "Account": null,
        "State": null,
        "Effective": null,
        "Expiration": null,
        "CarrierId": null
      },
      "TD": {
        "CrrPrmtAccId": null,
        "AccountNo": null,
        "State": null,
        "CarrierId": null
      },
      "TE": {
        "CarrierId": null,
        "MC": null,
        "DOT": null,
        "CrType": null,
        "SCAC": null,
        "RateConfEmailAddress": null
      },
      "TF": {
        "BillingId": null,
        "EntityId": {
          "EntityId": null,
          "BusinessId": null
        },
        "PayToTheOrderOf": null,
        "ContactName": null,
        "Phone": {
          "PhnFaxId": null,
          "Number": null,
          "Extension": null,
          "Features": null,
          "Mobility": null,
          "Notes": null
        },
        "Fax": {
          "PhnFaxId": null,
          "Number": null,
          "Extension": null,
          "Features": null,
          "Mobility": null,
          "Notes": null
        },
        "Address": {
          "AddrId": null,
          "Street1": null,
          "Street2": null,
          "Street3": null,
          "City": null,
          "State": null,
          "Zip": null,
          "Country": null,
          "GpsLng": null,
          "GpsLat": null,
          "Notes": null
        },
        "EMail": null,
        "BillingTagId": {
          "BillingTagId": null,
          "BillingTag": null
        },
        "DateIn": null,
        "DateOut": null,
        "CreditLimit": null,
        "CreditHold": null,
        "Notes": null
      },
      "TG": {
        "BillRuleId": null,
        "BankAccount": {
          "BankId": null,
          "BillingId": null,
          "Institution": {
            "BrnchId": null,
            "BizId": null,
            "BrnchAddress": {
              "AddrId": null,
              "Street1": null,
              "Street2": null,
              "Street3": null,
              "City": null,
              "State": null,
              "Zip": null,
              "Country": null,
              "GpsLng": null,
              "GpsLat": null,
              "Notes": null
            },
            "BrnchPhone": {
              "PhnFaxId": null,
              "Number": null,
              "Extension": null,
              "Features": null,
              "Mobility": null,
              "Notes": null
            },
            "BrnchFax": {
              "PhnFaxId": null,
              "Number": null,
              "Extension": null,
              "Features": null,
              "Mobility": null,
              "Notes": null
            }
          },
          "AccountNumber": null,
          "RoutingNumber": null,
          "AccountType": null,
          "Purpose": null,
          "VoidCheck": {
            "FileId": null,
            "DocumentTitle": null,
            "Keywords": null,
            "FileName": null,
            "FileData": null,
            "SHASIG": null,
            "MIMEType": null,
            "UploadDate": null,
            "ExpiredDate": null
          }
        },
        "Rule": null,
        "Amount": null,
        "Notes": null
      },
      "TH": {
        "AstId": {
          "PrsnId": null,
          "NickName": null,
          "Prefix": null,
          "FirstName": null,
          "MiddleName": null,
          "LastName": null,
          "Suffix": null,
          "BrnchId": null
        },
        "CurrentTitle": null,
        "AuthorityLevel": null,
        "DateCreated": null,
        "DateRemoved": null,
        "BizPhone": {
          "PhnFaxId": null,
          "Number": null,
          "Extension": null,
          "Features": null,
          "Mobility": null,
          "Notes": null
        },
        "BizFax": {
          "PhnFaxId": null,
          "Number": null,
          "Extension": null,
          "Features": null,
          "Mobility": null,
          "Notes": null
        },
        "BizEmail": null,
        "Notes": null
      }
    };
  }
}

app.service('CarrierFormService', ['$http', CarrierFormService]);