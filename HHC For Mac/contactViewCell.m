//
//  contactViewCell.m
//  HHC For Mac
//
//  Created by Bhavin on 2019-09-04.
//  Copyright © 2019 j2x. All rights reserved.
//

#import "contactViewCell.h"
#import "globals.h"


@implementation contactViewCell

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
    
    _imageBackGround.wantsLayer = YES;
    _imageBackGround.layer.backgroundColor = [[NSColor APP_PURPLE_COLOR] CGColor];
    
    _lightBackgroundColor.wantsLayer = YES;
    _lightBackgroundColor.layer.backgroundColor = [[NSColor LIGHT_GRAY_COLOR] CGColor];
    

    //headers
    
  
    
    _contactInforHeaderBackground.wantsLayer = YES;
    _contactInforHeaderBackground.layer.backgroundColor = [[NSColor LIGHT_GRAY_COLOR] CGColor];
    
    
    _workHeaderBackground.wantsLayer = YES;
    _workHeaderBackground.layer.backgroundColor = [[NSColor LIGHT_GRAY_COLOR] CGColor];
    
    
    _homeHeaderBackGround.wantsLayer = YES;
    _homeHeaderBackGround.layer.backgroundColor = [[NSColor LIGHT_GRAY_COLOR] CGColor];
    
    
    _otherHeadeBackground.wantsLayer = YES;
    _otherHeadeBackground.layer.backgroundColor = [[NSColor LIGHT_GRAY_COLOR] CGColor];
  
    
    
    
}

@end
