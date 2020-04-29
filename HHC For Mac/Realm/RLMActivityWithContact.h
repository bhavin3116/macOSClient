//
//  RLMActivityWithContact.h
//  HHC Api
//
//  Created by Bhavin on 2019-08-14.
//  Copyright © 2019 j2x. All rights reserved.
//

#import <Realm/Realm.h>



@interface RLMActivityWithContact : RLMObject

@property NSString *withContactID;
@property NSInteger withContactPk;
@property NSInteger activityPk;
@property int oldPk;

@end


