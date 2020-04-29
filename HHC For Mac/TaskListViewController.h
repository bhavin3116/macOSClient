//
//  TaskListViewController.h
//  HHC For Mac
//
//  Created by Bhavin on 2019-08-31.
//  Copyright © 2019 j2x. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface TaskListViewController : NSViewController <NSTableViewDelegate,NSTableViewDataSource> {
    
    
    
    
    IBOutlet NSView *taskDetailView;
    NSViewController *_subContentViewController;

 
    
    
    
    
}

@end

NS_ASSUME_NONNULL_END
