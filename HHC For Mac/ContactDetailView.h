//
//  ContactDetailView.h
//  HHC For Mac
//
//  Created by Bhavin on 2019-08-26.
//  Copyright © 2019 j2x. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RealmContact.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactDetailView : NSViewController <NSTableViewDelegate,NSTableViewDataSource>{

    
 
}


@property (strong,nonatomic) RealmContact *rlmContact;




@end

NS_ASSUME_NONNULL_END
