//
//  AppDelegate.m
//  HHC Api
//
//  Created by Bhavin on 2019-06-17.
//  Copyright © 2019 j2x. All rights reserved.
//

#ifndef globals_h
#define globals_h


#endif /* globals_h */

// define tint color for the app
// keystroke orange
// #define APP_TINT_COLOR          colorWithRed:0.92f green:0.42f blue:0.19f alpha:1.0
// HEX F16725
//REgular
// #define APP_TINT_COLOR           colorWithRed:241.0/255.0 green:103.0/255.0 blue:37.0/255.0 alpha:1.0
//New Eric
 #define APP_TINT_COLOR           colorWithRed:250.0/255.0 green:81.0/255.0 blue:31.0/255.0 alpha:1.0

 #define APP_LIGHT_ORANGE         colorWithRed:253.0/255.0 green:235.0/255.0 blue:220.0/255.0 alpha:1.0

#define APP_PURPLE_COLOR           colorWithRed:42.0/255.0 green:31.0/255.0 blue:65.0/255.0 alpha:1.0
//#2A1F41
#define LIGHT_PURPLE_COLOR           colorWithRed:104.0/255.0 green:98.0/255.0 blue:122.0/255.0 alpha:1.0

#define LIGHT_GRAY_COLOR           colorWithRed:233.0/255.0 green:232.0/255.0 blue:236.0/255.0 alpha:1.0


#define SUCCESS_GREEN_COLOR         colorWithRed:0.0/255.0 green:125.0/255.0 blue:28.0/255.0 alpha:1.0



 // #define APP_TEXT_HILITE_COLOR   colorWithRed:0.12f green:0.29f blue:0.14f alpha:1.0
 #define APP_TEXT_HILITE_COLOR   colorWithRed:241.0/255.0 green:103.0/255.0 blue:37.0/255.0 alpha:1.0


#define APP_BORDER_COLOR        colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0

#define SHOW_SPINNER [(HHCDelegate*)[UIApplication sharedApplication].delegate showActivity];

#define HIDE_SPINNER [(HHCDelegate*)[UIApplication sharedApplication].delegate hideActivity];


#define kImportGroup @"HHC Import"

#define kContactSetupKey @"SharedContactSetup"

//Size
#define IS_IPHONE ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
#define IS_IPHONE_RETINA ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [[UIScreen mainScreen] scale] == 2.00 )
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define IS_IPAD ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad )
#define IS_IPAD_RETINA ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad && [[UIScreen mainScreen] scale] == 2.00 )
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_ZOOMED (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

__attribute__((annotate("returns_localized_nsstring")))
static inline NSString *LocalizationNotNeeded(NSString *s) {
    return s;
}


//Constans for the app
static NSString *const kUserToken = @"UserToken";
static NSString *const kUserName = @"UserName";
static NSString *const kUserPassword = @"UserPassword";




// define positions in the tabbar controller
typedef NS_ENUM(NSUInteger, TabBarIndexs)
{
    TabBarIndexHome = 0,
    TabBarIndexContacts,
    TabBarIndexTasks,
    TabBarIndexCalendar,
    TabBarIndexSyncStatus,
    TabBarIndexFavourites,
    TabBarIndexContactSets,
    TabBarIndexSettings,
    TabBarIndexAlerts,
    TabBarIndexImport
};

// define contactlist transaction types
typedef NS_ENUM(short, ContactListTransactionTypes)
{
    ContactListTransactionTypeNormal = 0,     // 0,regular contact list
    ContactListTransactionTypeSelect,         //1
    ContactListTransactionTypeSelectMany,     // 2,select 1 or more contacts
    ContactListTransactionTypeFavourites,     //3
    ContactListTransactionTypeContactSets     // 4,searches
};



