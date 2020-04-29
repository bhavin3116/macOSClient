//
//  ContactListCell.h
//  HHC For Mac
//
//  Created by Bhavin on 2019-09-02.
//  Copyright © 2019 j2x. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContactListCell : NSTableCellView
@property (strong) IBOutlet NSView *imageBackground;
@property (strong) IBOutlet NSView *shadowView;

@property (strong) IBOutlet NSImageView *editImage;
@property (strong) IBOutlet NSImageView *deleteImage;





@end

NS_ASSUME_NONNULL_END
