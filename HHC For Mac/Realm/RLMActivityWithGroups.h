//
//  RLMActivityWithGroups.h
//  HHC Api
//
//  Created by Bhavin on 2019-08-14.
//  Copyright © 2019 j2x. All rights reserved.
//

#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface RLMActivityWithGroups : RLMObject


@property NSString *withGroupID;
@property NSInteger withGroupPk;
@property NSInteger activityPk;
@property int oldPk;


@end

NS_ASSUME_NONNULL_END
