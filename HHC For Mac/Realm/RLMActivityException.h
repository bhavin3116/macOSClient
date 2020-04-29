//
//  RLMActivityException.h
//  HHC Api
//
//  Created by Bhavin on 2019-08-14.
//  Copyright © 2019 j2x. All rights reserved.
//

#import <Realm/Realm.h>


@interface RLMActivityException : RLMObject


@property NSString *exceptionDate;
@property NSInteger activityPk;
@property int oldPk;


@end

