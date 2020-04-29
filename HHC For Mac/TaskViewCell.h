//
//  TaskViewCell.h
//  HHC For Mac
//
//  Created by Bhavin on 2019-09-06.
//  Copyright © 2019 j2x. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface TaskViewCell : NSTableCellView

@property (strong) IBOutlet NSView *imageBackground;

@property (weak) IBOutlet NSView *headerBackground;


@property (strong) IBOutlet NSView *firstcellBackgrond;


@property (weak) IBOutlet NSView *locationHeaderView;

@property (weak) IBOutlet NSView *scheduleWithheader;
@property (weak) IBOutlet NSView *recurrenceHeader;
@property (weak) IBOutlet NSView *otherHeader;

@property (weak) IBOutlet NSView *detailsHeader;



@end

NS_ASSUME_NONNULL_END
