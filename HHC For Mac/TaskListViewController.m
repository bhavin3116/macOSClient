//
//  TaskListViewController.m
//  HHC For Mac
//
//  Created by Bhavin on 2019-08-31.
//  Copyright © 2019 j2x. All rights reserved.
//

#import "TaskListViewController.h"
#import "TaskListCell.h"
#import <Realm/Realm.h>
#import "RealmActivity.h"
#import "TaskDetailViewController.h"
#import "globals.h"
#import "tableRowView.h"


@interface TaskListViewController ()


@property (strong) IBOutlet NSTableView *taskListTable;
@property (strong) IBOutlet NSSplitView *taskSplitView;



//This is the defualt datasource
@property (strong,nonatomic) NSArray *dataSource;
@property (strong,nonatomic) NSMutableArray *listElement;
@property (strong) TaskListCell *selectedtaskCell;


//UI

@property (strong) IBOutlet NSView *addButtonBackground;



@property (strong) IBOutlet NSView *listViewBackground;



//Cell property

@property (strong) IBOutlet NSTextField *regardingText;
@property (strong) IBOutlet NSTextField *scheduleWith;
@property (strong) IBOutlet NSTextField *dateTime;
@property (strong) IBOutlet NSImageView *typeIcon;
@property (strong) IBOutlet NSImageView *recIcon;





@end




@implementation TaskListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    
    [self prepareView];
    [self prepareDataSource];
    [self addDefaultSelected];
    [_taskSplitView setPosition:400 ofDividerAtIndex:0];

}


-(void)addDefaultSelected{
    
    
    //nil
    
    if (![_subContentViewController isKindOfClass:[NSViewController class]]) {

        RealmActivity *temp = _listElement[0];
        TaskDetailViewController *detailView = [[TaskDetailViewController alloc] initWithNibName:@"TaskDetailViewController" bundle:nil];
        detailView.rlmActivity = temp;

        //Assign
        
        _subContentViewController = detailView;
        NSView *view = [_subContentViewController view];
        view.frame = taskDetailView.bounds;
        [view setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [taskDetailView addSubview:view];
        
    }
   
    
}


-(void)prepareView {
    
    
    //Table
    
    NSNib *nib = [[NSNib alloc] initWithNibNamed:@"TaskListCell" bundle:nil];
    [_taskListTable registerNib:nib forIdentifier:@"TaskListCell"];
    [_taskListTable setNeedsDisplay:YES];
    
    
    
    //Temp
    
//    NSString *title = @"Task List";
//    NSTableColumn *yourColumn = _taskListTable.tableColumns.lastObject;
//    [yourColumn.headerCell setStringValue:title];
//    // optional
//    [_taskListTable.headerView setNeedsLayout:YES];


    
    self.addButtonBackground.wantsLayer = YES;
    self.addButtonBackground.layer.backgroundColor = [[NSColor APP_TINT_COLOR] CGColor];
    
 
    _taskListTable.layer.cornerRadius = 0;
    _taskListTable.layer.borderWidth = 0;
    
    
    
    _listViewBackground.wantsLayer = YES;
    _listViewBackground.layer.backgroundColor = [[NSColor whiteColor] CGColor];
    
    
    
    
    
    
}

-(void)prepareDataSource {
    
    
    
    RLMResults *results = [RealmActivity allObjects];
    _listElement = [NSMutableArray array];
    
    
    RLMResults *AllResults = [results objectsWhere:[NSString stringWithFormat:@"flag <> 'D'"]];
    
    
//    RLMResults *filtered = [contactResults sortedResultsUsingDescriptors:@[[RLMSortDescriptor sortDescriptorWithKeyPath:@"FirstName" ascending:YES],[RLMSortDescriptor sortDescriptorWithKeyPath:@"LastName" ascending:YES]]];

    
    for (RealmActivity *act in AllResults) {
        
        [_listElement addObject:act];
        
    }

}


#pragma mark Table View




- (NSTableRowView *)tableView:(NSTableView *)tableView rowViewForRow:(NSInteger)row{
    
    tableRowView *cell = [[tableRowView alloc] init];
    return cell;
    
}
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    
    //    RLMResults *allContacts = [RealmContact allObjects];
    //    return allContacts.count;

    return _listElement.count;

    
    
}


- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    
    //seprate the list
    
    
//    SomeClass *someObject = [self.myObjects objectAtIndex:row];
//
//    if (someObject.isSectionHeading) {
//        cell = [tableView makeViewWithIdentifier:@"HeaderCell" owner:self];
//        cell.textField.objectValue = someObject.headingName;
//    } else {
//        cell = [tableView makeViewWithIdentifier:@"DataCell" owner:self];
//        cell.textField.objectValue = someObject.rowValue;
//    }
//    return cell;
    

    
      TaskListCell *cell = [tableView makeViewWithIdentifier:@"TaskListCell" owner:self];
      RealmActivity *temp = _listElement[row];
    

    _regardingText.stringValue = temp.regarding.length>0?temp.regarding:@"";
     NSString *temp1 = [temp.startTime substringToIndex:[temp.startTime length] - 9];
    
     _dateTime.stringValue = temp1.length>0?temp1:@"";
    _typeIcon.image = [self getImageIconFor:temp.Type];
    
    
    _scheduleWith.stringValue = temp.scheduledFor.length>0?temp.scheduledFor:@"";
    
    if (temp.recurring) {
        _recIcon.hidden = FALSE;
    }
    else
    {
         _recIcon.hidden = TRUE;
    }

    return cell;
    
    
    
}

-(void)tableViewSelectionDidChange:(NSNotification *)notification{
    
    
    
    NSLog(@"%ld",(long)[[notification object] selectedRow]);
    
    
    
    if (_selectedtaskCell) {
        _selectedtaskCell.lightshadowView.layer.backgroundColor  = [[NSColor LIGHT_GRAY_COLOR] CGColor];
        
        
    }
    
    _selectedtaskCell = [_taskListTable viewAtColumn:0 row:(long)[[notification object] selectedRow] makeIfNecessary:YES];
    _selectedtaskCell.lightshadowView.layer.backgroundColor = [[NSColor APP_TINT_COLOR] CGColor];


    if (_subContentViewController) {
        [[_subContentViewController view] removeFromSuperview];

    }
    
    
    RealmActivity *temp = _listElement[(long)[[notification object] selectedRow]];
    TaskDetailViewController *detailView = [[TaskDetailViewController alloc] initWithNibName:@"TaskDetailViewController" bundle:nil];
    detailView.rlmActivity = temp;

    
    //Assign
    
    _subContentViewController = detailView;
    NSView *view = [_subContentViewController view];
    view.frame = taskDetailView.bounds;
    [view setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [taskDetailView addSubview:view];
 
    
    
//    NSView *view = [detailView view];
//    view.frame = taskDetailView.bounds;
//    [view setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    
    
    
    
    
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
