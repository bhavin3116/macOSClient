//
//  RealmContact.h
//  HHC Api
//
//  Created by Bhavin on 2019-07-04.
//  Copyright © 2019 j2x. All rights reserved.
//

#import <Realm/Realm.h>



@interface RealmContact : RLMObject

//Internally needed

@property NSString *uuid;
@property int oldPk;
@property NSString *flag;


//Coming from Act !

@property NSString *actID;
@property NSString *eTime;
@property NSString *createdTime;
@property NSString *Company;
@property NSString *FirstName;
@property NSString *LastName;
@property NSString *fullName;
@property NSString *Title;
@property NSString *Department;
@property NSString *PrimaryEmailAddress;
@property NSString *PersonalEmailAddress;
@property NSString *Phone;
@property NSString *Ext;
@property NSString *Fax;
@property NSString *Home_Phone;
@property NSString *MobilePhone;
@property NSString *Pager;
@property NSString *AltExt;
@property NSString *AltPhone;
@property NSString *Addr1;
@property NSString *Addr2;
@property NSString *Addr3;
@property NSString *City;
@property NSString *State;
@property NSString *Zip;
@property NSString *Country;
//Coming from Act !
@property double workAddress_Latitude;
@property double workAddress_Longitude;



@property NSString *Spouse;
@property NSString *HomeAddress_Line1;
@property NSString *HomeAddress_Line2;
@property NSString *HomeAddress_Line3;
@property NSString *HomeAddress_City;
@property NSString *HomeAddress_State;
@property NSString *HomeAddress_postalCode;
@property NSString *HomeAddress_Country;
//Coming from Act !
@property double HomeAddress_Latitude;
@property double HomeAddress_Longitude;


@property NSString *webSite;
@property NSString *ID_Status;
@property NSString *lastResults;



//More fields
@property BOOL favourite;


@property double amaScore;
@property NSString *BirthDate;
@property NSString *messengerID;
@property NSString *altEmailAddress;
@property NSString *homeExtension;
@property NSString *referredBy;
@property NSString *faxExtension;
@property NSString *salutation;
@property NSString *mobileExtension;
@property NSString *pagerExtension;
@property NSString *companyID;
@property NSString *editedBy;
@property NSString *middleName;
@property NSString *recordManager;
@property NSString *recordOwner;
@property BOOL isUser;
@property NSString *businessMaskFormat;
@property NSString *mobileMaskFormat;
@property double mobileCountryCode;


//standard fields 1 to 10


@property NSString *User1;
@property NSString *User2;
@property NSString *User3;
@property NSString *User4;
@property NSString *User5;
@property NSString *User6;
@property NSString *User7;
@property NSString *User8;
@property NSString *User9;
@property NSString *User10;



//custom fields 11 to 50

@property NSString *User11;
@property NSString *User12;
@property NSString *User13;
@property NSString *User14;
@property NSString *User15;
@property NSString *User16;
@property NSString *User17;
@property NSString *User18;
@property NSString *User19;
@property NSString *User20;
@property NSString *User21;
@property NSString *User22;
@property NSString *User23;
@property NSString *User24;
@property NSString *User25;
@property NSString *User26;
@property NSString *User27;
@property NSString *User28;
@property NSString *User29;
@property NSString *User30;
@property NSString *User31;
@property NSString *User32;
@property NSString *User33;
@property NSString *User34;
@property NSString *User35;
@property NSString *User36;
@property NSString *User37;
@property NSString *User38;
@property NSString *User39;
@property NSString *User40;
@property NSString *User41;
@property NSString *User42;
@property NSString *User43;
@property NSString *User44;
@property NSString *User45;
@property NSString *User46;
@property NSString *User47;
@property NSString *User48;
@property NSString *User49;
@property NSString *User50;


//Inside app

@property double latitude_work;
@property double longitude_work;
@property double latitude_home;
@property double longitude_home;




@end


