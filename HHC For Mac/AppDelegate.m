//
//  AppDelegate.m
//  HHC For Mac
//
//  Created by Bhavin on 2019-08-16.
//  Copyright © 2019 j2x. All rights reserved.
//

#import "AppDelegate.h"
#import <Realm/Realm.h>


@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    //Realm
    
    [self RealmLocationwithMigrationBlock];

  //  buttonCode add on 1st view controlwe
    
  
//    NSButton *closeButton = [window standardWindowButton:NSWindowCloseButton]; // Get the existing close button of the window. Check documentation for the other window buttons.
//    NSView *titleBarView = closeButton.superview; // Get the view that encloses that standard window buttons.
//    NSButton *myButton = …; // Create custom button to be added to the title bar.
//    myButton.frame = …; // Set the appropriate frame for your button. Use titleBarView.bounds to determine the bounding rect of the view that encloses the standard window buttons.
//    [titleBarView addSubview:myButton]; // Add the custom button to the title bar.
//
//
    // Insert code here to initialize your application
    
    
  
    
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}





-(void) RealmLocationwithMigrationBlock {
    
    
    [[NSFileManager defaultManager] URLForDirectory:NSApplicationSupportDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    
    NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *appSupportDirPath = [paths1 firstObject];
    NSString *realmPath = [appSupportDirPath stringByAppendingPathComponent:@"default.realm"];
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    
    config.schemaVersion = 4;
    config.migrationBlock = ^(RLMMigration *migration, uint64_t  oldSchemaVersion) {
        
        if (oldSchemaVersion == config.schemaVersion) {
            
            //Do nothing
        }else{
            if (oldSchemaVersion < config.schemaVersion) {
                
                
            }
        }
    };
    
    //APP support
    config.fileURL = [NSURL fileURLWithPath:realmPath];
    [RLMRealmConfiguration setDefaultConfiguration:config];
    NSLog(@"realm:%@", [[[RLMRealm defaultRealm]configuration]fileURL]);
    
    
    
}

@end
