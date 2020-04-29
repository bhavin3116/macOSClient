//
//  ViewController.h
//  HHC For Mac
//
//  Created by Bhavin on 2019-08-22.
//  Copyright © 2019 j2x. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PXSourceList.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : NSViewController <NSOutlineViewDelegate,NSOutlineViewDataSource,NSMenuDelegate,NSTableViewDelegate,NSTableViewDataSource,PXSourceListDelegate,PXSourceListDataSource> {
    
    
@private
   // NSWindow *_window1;
    IBOutlet NSView *_mainContentView;
    NSArray *_topLevelItems;
    NSViewController *_currentContentViewController;
    IBOutlet NSOutlineView *_sidebarOutlineView;
    IBOutlet NSView *_subContentView;
 
}




@property (assign) IBOutlet NSWindow *window;

- (IBAction)sidebarMenuDidChange:(id)sender;


@property (strong) IBOutlet NSView *customView;
@property (strong) IBOutlet NSBox *background;


@end

NS_ASSUME_NONNULL_END
