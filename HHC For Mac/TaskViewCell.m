//
//  TaskViewCell.m
//  HHC For Mac
//
//  Created by Bhavin on 2019-09-06.
//  Copyright © 2019 j2x. All rights reserved.
//

#import "TaskViewCell.h"
#import "globals.h"



@implementation TaskViewCell

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    
    _imageBackground.wantsLayer = YES;
    _imageBackground.layer.backgroundColor = [[NSColor APP_PURPLE_COLOR] CGColor];
    
    
    _headerBackground.wantsLayer = YES;
    _headerBackground.layer.backgroundColor = [[NSColor LIGHT_GRAY_COLOR] CGColor];
    
    
    _firstcellBackgrond.wantsLayer = YES;
    _firstcellBackgrond.layer.backgroundColor = [[NSColor LIGHT_GRAY_COLOR] CGColor];
    
    
    _locationHeaderView.wantsLayer = YES;
    _locationHeaderView.layer.backgroundColor = [[NSColor LIGHT_GRAY_COLOR] CGColor];
    
    
    _recurrenceHeader.wantsLayer = YES;
    _recurrenceHeader.layer.backgroundColor = [[NSColor LIGHT_GRAY_COLOR] CGColor];
    
    
    _otherHeader.wantsLayer = YES;
    _otherHeader.layer.backgroundColor = [[NSColor LIGHT_GRAY_COLOR] CGColor];
    
    _scheduleWithheader.wantsLayer = YES;
    _scheduleWithheader.layer.backgroundColor = [[NSColor LIGHT_GRAY_COLOR] CGColor];
    
    
    _detailsHeader.wantsLayer = YES;
    _detailsHeader.layer.backgroundColor = [[NSColor LIGHT_GRAY_COLOR] CGColor];
    
    
    
    
    // Drawing code here.
}

@end
