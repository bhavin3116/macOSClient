//
//  TaskListCell.m
//  HHC For Mac
//
//  Created by Bhavin on 2019-09-05.
//  Copyright © 2019 j2x. All rights reserved.
//



#import "TaskListCell.h"
#import "globals.h"



@implementation TaskListCell

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    
    
    _lightshadowView.wantsLayer = YES;
    _lightshadowView.layer.backgroundColor = [[NSColor LIGHT_GRAY_COLOR] CGColor];
    
    
    
    //Image Backgroundview
    
//    CGPoint = CGPointMake((_imageBackground.frame.origin.x + (_imageBackground.frame.size.width / 2)),
//                              (_imageBackground.frame.origin.y + (_imageBackground.frame.size.height / 2)));
    
    
  // CGPointMake(NSMidX(_imageBackground.frame), NSMidY(_imageBackground.frame));
    

    
    CGPoint saveCenter = CGPointMake(NSMidX(_imageBackground.frame), NSMidY(_imageBackground.frame));
    
    CGRect newFrame = CGRectMake(_imageBackground.frame.origin.x, _imageBackground.frame.origin.y, 60.0, 60.0);
    _imageBackground.frame = newFrame;
    _imageBackground.layer.cornerRadius = 60.0 / 2.0;
    
    
  //  _imageBackground.center = saveCenter;
    _imageBackground.layer.backgroundColor = [[NSColor APP_PURPLE_COLOR] CGColor] ;
    
    
    
    
    
    
    //Shadow
    
    
//    [_lightshadowView.layer setCornerRadius:5.0f];
//    [_lightshadowView.layer setBorderColor:[NSColor LIGHT_GRAY_COLOR].CGColor];
//    [_lightshadowView.layer setBorderWidth:0.2f];
//    [_lightshadowView.layer setShadowColor:[NSColor colorWithRed:225.0/255.0 green:228.0/255.0 blue:228.0/255.0 alpha:1.0].CGColor];
//    [_lightshadowView.layer setShadowOpacity:1.0];
//    [_lightshadowView.layer setShadowRadius:5.0];
//    [_lightshadowView.layer setShadowOffset:CGSizeMake(5.0f, 5.0f)];
    
    
   
    
    // Drawing code here.
    
  
    //Circle
    
    
    // Get the graphics context that we are currently executing under
    NSGraphicsContext* gc = [NSGraphicsContext currentContext];
    
    // Save the current graphics context settings
    [gc saveGraphicsState];
    
    // Set the color in the current graphics context for future draw operations
    [[NSColor APP_PURPLE_COLOR] setStroke];
    [[NSColor APP_PURPLE_COLOR] setFill];
    
    // Create our circle path
    NSRect rect = NSMakeRect(25, 20, 60, 60);
    NSBezierPath* circlePath = [NSBezierPath bezierPath];
    [circlePath appendBezierPathWithOvalInRect: rect];
    
    // Outline and fill the path
    [circlePath stroke];
    [circlePath fill];
    
    // Restore the context to what it was before we messed with it
    [gc restoreGraphicsState];
    

    
 
    
    
}

@end
