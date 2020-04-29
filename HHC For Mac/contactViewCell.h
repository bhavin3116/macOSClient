//
//  contactViewCell.h
//  HHC For Mac
//
//  Created by Bhavin on 2019-09-04.
//  Copyright © 2019 j2x. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface contactViewCell : NSTableCellView


@property (weak,nonatomic) IBOutlet NSTextField *emailText;
@property (strong) IBOutlet NSView *imageBackGround;
@property (strong) IBOutlet NSView *lightBackgroundColor;


@property (strong) IBOutlet NSView *contactInforHeaderBackground;


@property (weak) IBOutlet NSView *workHeaderBackground;


@property (weak) IBOutlet NSView *homeHeaderBackGround;




@property (weak) IBOutlet NSView *otherHeadeBackground;



@end

NS_ASSUME_NONNULL_END
