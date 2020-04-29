//
//  HHCContactListViewController.h
//  HHC For Mac
//
//  Created by Bhavin on 2019-09-03.
//  Copyright © 2019 j2x. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHCContactListViewController : NSViewController <NSTableViewDelegate,NSTableViewDataSource> {
    
   
    IBOutlet NSView *_contactDetailView;
    NSViewController *_subContentViewController;
    IBOutlet NSView *_contactListView;
    
    
}

@end

NS_ASSUME_NONNULL_END
