//
//  ContactListCell.m
//  HHC For Mac
//
//  Created by Bhavin on 2019-09-02.
//  Copyright © 2019 j2x. All rights reserved.
//

#import "ContactListCell.h"
#import "globals.h"


@implementation ContactListCell

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
//
//    _imageBackground.wantsLayer = YES;
//
//
////    _imageBackground.layer.backgroundColor = [[NSColor APP_TINT_COLOR] CGColor];
////    _imageBackground.layer.cornerRadius = _imageBackground.layer.frame.size.width/2;
//
//
//   // CGPoint saveCenter = _imageBackground.center;
//    CGRect newFrame = CGRectMake(_imageBackground.frame.origin.x, _imageBackground.frame.origin.y, 50.0, 50.0);
//    _imageBackground.frame = newFrame;
//    _imageBackground.layer.cornerRadius = 40.0 / 2.0;
//   // _imageBackground.center = saveCenter;
//    _imageBackground.layer.backgroundColor = [[NSColor APP_PURPLE_COLOR] CGColor];

    
    
    //Circlular design

    // Get the graphics context that we are currently executing under
    NSGraphicsContext* gc = [NSGraphicsContext currentContext];
    
    // Save the current graphics context settings
    [gc saveGraphicsState];
    
    // Set the color in the current graphics context for future draw operations
    [[NSColor APP_PURPLE_COLOR] setStroke];
    [[NSColor APP_PURPLE_COLOR] setFill];
    
    // Create our circle path
    NSRect rect = NSMakeRect(10, 15, 40, 40);
    NSBezierPath* circlePath = [NSBezierPath bezierPath];
    [circlePath appendBezierPathWithOvalInRect: rect];
    
    // Outline and fill the path
    [circlePath stroke];
    [circlePath fill];
    
    // Restore the context to what it was before we messed with it
    [gc restoreGraphicsState];
    
    
    //COLOR
    
    
    _shadowView.wantsLayer = YES;
    _shadowView.layer.backgroundColor = [[NSColor LIGHT_GRAY_COLOR] CGColor];
    
    
    
    //circle
    
    CGPoint saveCenter = CGPointMake(NSMidX(_imageBackground.frame), NSMidY(_imageBackground.frame));
    CGRect newFrame = CGRectMake(_imageBackground.frame.origin.x, _imageBackground.frame.origin.y, 40.0, 40.0);
    _imageBackground.frame = newFrame;
    _imageBackground.layer.cornerRadius = 40.0 / 2.0;

    //  _imageBackground.center = saveCenter;
    _imageBackground.layer.backgroundColor = [[NSColor APP_PURPLE_COLOR] CGColor] ;
    
 
    
    _editImage.hidden = YES;
    _deleteImage.hidden = YES;
    
    
}




- (IBAction)iconView:(id)sender {
    
    
    
    
}
@end
