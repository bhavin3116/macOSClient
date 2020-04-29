//
//  TaskDetailViewController.m
//  HHC For Mac
//
//  Created by Bhavin on 2019-09-05.
//  Copyright © 2019 j2x. All rights reserved.
//

#import "TaskDetailViewController.h"
#import "TaskViewCell.h"


@interface TaskDetailViewController ()
@property (strong) IBOutlet NSTableView *_tableView;


//Cell text values

//Cell1


@property (strong) IBOutlet NSImageView *typeIcon;
@property (strong) IBOutlet NSTextField *regardingText;
@property (strong) IBOutlet NSTextField *dateTime;


@end




@implementation TaskDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNib *nib = [[NSNib alloc] initWithNibNamed:@"TaskViewCell" bundle:nil];
    [__tableView registerNib:nib forIdentifier:@"taskcell1"];
    [__tableView registerNib:nib forIdentifier:@"taskcell2"];
    [__tableView registerNib:nib forIdentifier:@"taskcell3"];
    [__tableView registerNib:nib forIdentifier:@"taskcell4"];
    [__tableView registerNib:nib forIdentifier:@"taskcell5"];
    [__tableView registerNib:nib forIdentifier:@"taskcell6"];
    
    
    [__tableView setNeedsDisplay:YES];
    
    
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [[NSColor whiteColor] CGColor];
    
    
    
    
    // Do view setup here.
}


#pragma mark table delegate


- (BOOL)tableView:(NSTableView *)aTableView shouldSelectRow:(NSInteger)rowIndex
{
    return NO;
}



-(CGFloat) tableView:(NSTableView *)tableView
         heightOfRow:(NSInteger)row{
    
    //Name
    
    if (row==0) {
        
        return 120;
    }
    
    
  //nfo
    
    
    if (row == 1) {
        
        return 82;
        
    }
    
    
    if (row == 2) {
        return 91;
    }
    
    //ad
    
    if (row == 3) {
        return 125;
        
    }
    
    if (row == 4) {
        return 156;
        
    }
    
    
    if (row == 5) {
        return 102;
        
    }
    
    //other
    
    
    return 90;
    
    
    
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
   
    return 6;
    
    
}




- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    if (row == 0) {
        
        
         TaskViewCell *cell = [tableView makeViewWithIdentifier:@"taskcell1" owner:self];
        _regardingText.stringValue = _rlmActivity.regarding.length>0?_rlmActivity.regarding:@"Lunch Meeting";
        _typeIcon.image = [self getImageIconFor:_rlmActivity.Type];
         return cell;
   

    }
    
    
    if (row == 1) {
        
        TaskViewCell *cell = [tableView makeViewWithIdentifier:@"taskcell2" owner:self];
        return cell;
        
    }
    
    
    if (row == 2) {
        
        TaskViewCell *cell = [tableView makeViewWithIdentifier:@"taskcell3" owner:self];
        return cell;
        
    }
    
    
    
    if (row == 3) {
        
        TaskViewCell *cell = [tableView makeViewWithIdentifier:@"taskcell4" owner:self];
        return cell;
        
    }
    
    
    if (row == 4) {
        
        TaskViewCell *cell = [tableView makeViewWithIdentifier:@"taskcell5" owner:self];
        return cell;
        
    }
    
    
    if (row == 5) {
        
        TaskViewCell *cell = [tableView makeViewWithIdentifier:@"taskcell6" owner:self];
        return cell;
        
    }
    
    else
    
    {
        
        
        TaskViewCell *cell = [tableView makeViewWithIdentifier:@"taskcell6" owner:self];
        return cell;
        
        
    }
    
 
    
    
    
}




-(NSImage *)getImageIconFor:(NSString *)activityType{
    
    
    
    //TODO:
    
    
    if ([activityType isEqualToString:@"Call"]) {
        return [NSImage imageNamed:@"activity-phone"];
        
    }
    
    if ([activityType isEqualToString:@"Meeting"]) {
        return [NSImage imageNamed:@"activity-meeting"];
        
    }
    
    
    if ([activityType isEqualToString:@"To-do"]) {
        return [NSImage imageNamed:@"activity-todo"];
        
    }
    
    
    if ([activityType isEqualToString:@"Vacation"]) {
        return [NSImage imageNamed:@"activity-vacation"];
        
    }
    
    if ([activityType isEqualToString:@"Personal Activity"]) {
        return [NSImage imageNamed:@"activity-personal"];
        
    }
    
    else
        
    {
        
        return [NSImage imageNamed:@"activity-other"];
        
        
    }
    
    
    
}



@end
