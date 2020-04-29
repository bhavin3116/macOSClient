//
//  RealmActivity.h
//  HHC Api
//
//  Created by Bhavin on 2019-08-14.
//  Copyright © 2019 j2x. All rights reserved.
//

#import <Realm/Realm.h>
#import "RLMActivityException.h"
#import "RLMActivityWithContact.h"
#import "RLMActivityWithGroups.h"
#import "RLMActivityWithCompany.h"



RLM_ARRAY_TYPE(RLMActivityException)
RLM_ARRAY_TYPE(RLMActivityWithContact)
RLM_ARRAY_TYPE(RLMActivityWithGroups)
RLM_ARRAY_TYPE(RLMActivityWithCompany)



@interface RealmActivity : RLMObject


@property RLMArray<RLMActivityException *><RLMActivityException> *exceptions;
@property RLMArray<RLMActivityWithContact *><RLMActivityWithContact> *withContacts;
@property RLMArray<RLMActivityWithGroups *><RLMActivityWithGroups> *withGroups;
@property RLMArray<RLMActivityWithCompany *><RLMActivityWithCompany> *withCompanies;


@property NSString *parentContactID;
@property NSInteger parentContactPK;

@property NSString *uuid;

@property  NSString * flag;
@property  NSString *ID;
@property  int oldPk;
@property  NSString* Type;
@property  NSInteger TypeId;
@property  NSString* ETime;
@property  NSString* startTime;
@property  NSString* CTime;
@property  NSString* endTime;
@property  NSString* MTime;



//For reccurance

@property NSString* seriesStart;
@property NSString* seriesEnd;
@property NSDate *seriesStartDate;
@property NSDate *seriesEndDate;




@property NSString *typedDay;
@property NSString *dayType;
@property NSString *ordinal;

@property NSString *daysOfWeek;


@property NSDate *startTimeDate;
@property NSDate *endTimeDate;


@property  NSInteger startHour;
@property  NSInteger startMins;
@property  NSInteger endHour;
@property  NSInteger endMins;



@property  BOOL isTimeless;
@property  BOOL alarmOn;
@property  BOOL cleared;
@property  BOOL isPrivate;
@property  BOOL isAlarmCleared;
@property  BOOL isEndless;
@property  BOOL alarmShown;



@property double latitude;
@property double longitude;




@property  NSString *details;
@property  NSInteger leadTimeMins;
@property  NSString *priority;
@property  NSInteger priorityID;
@property  NSString *seriesID;
@property  NSString *recurType;





@property  NSString *regarding;
@property  NSInteger recurring;
@property  NSInteger frequency;
@property  NSInteger dOW;
@property  NSInteger wOM;
@property  NSInteger dOM;
@property  NSInteger mOY;
@property  NSInteger durationMins;
@property  NSString *scheduledFor;
@property  NSString *scheduledForID;
@property  NSString *scheduledBy;
@property  NSString *scheduledByID;
@property  NSString *location;




@property  BOOL dirty;
@property  BOOL notifSet;
@property  BOOL validLocation;



//For calendar import Export
@property  NSString *eventIdentifier;




@end
