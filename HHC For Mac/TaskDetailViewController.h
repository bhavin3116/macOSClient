//
//  TaskDetailViewController.h
//  HHC For Mac
//
//  Created by Bhavin on 2019-09-05.
//  Copyright © 2019 j2x. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RealmActivity.h"


NS_ASSUME_NONNULL_BEGIN

@interface TaskDetailViewController : NSViewController <NSTableViewDelegate,NSTableViewDataSource> {
    
    
    
    
}




@property (strong,nonatomic) RealmActivity *rlmActivity;
@end

NS_ASSUME_NONNULL_END
