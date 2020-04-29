//
//  ViewController.m
//  HHC For Mac
//
//  Created by Bhavin on 2019-08-22.
//  Copyright © 2019 j2x. All rights reserved.
//

#import "ViewController.h"
#import "SidebarTableCellView.h"
#import "globals.h"
#import "ContactsUI/ContactsUI.h"
#import "ContactDetailView.h"
#import "TaskListViewController.h"
#import "HHCContactListViewController.h"
#import "tableRowView.h"
#import "menuItemCell.h"



@interface ViewController ()


@property (strong) menuItemCell *selectedsidebarCell;




@end

@implementation ViewController


@synthesize window = _window1;


- (void)viewDidLoad {
    [super viewDidLoad];
    
   
  //   _topLevelItems = [NSArray arrayWithObjects:@"Favorites", @"Content Views", @"Mailboxes", @"A Fourth Group", nil];

    _topLevelItems = [NSArray arrayWithObjects:@"DASHBOARD", @"CONTACTS", @"TASKLIST", @"CALENDAR", @"OPPORTUNITIES", @"SYNC STATUS",nil];


    [_sidebarOutlineView sizeLastColumnToFit];
    [_sidebarOutlineView reloadData];
    [_sidebarOutlineView setFloatsGroupRows:NO];

 
    
    [_sidebarOutlineView setRowSizeStyle:NSTableViewRowSizeStyleCustom];
    [_sidebarOutlineView setRowActionsVisible:NO];
    [_sidebarOutlineView setIntercellSpacing:NSMakeSize(0, 0)];
 
    

    // Expand all the root items; disable the expansion animation that normally happens
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:0];
    [_sidebarOutlineView expandItem:nil expandChildren:YES];
    [NSAnimationContext endGrouping];
    
    
    
    
    NSNib *nib = [[NSNib alloc] initWithNibNamed:@"menuItemCell" bundle:nil];
    [_sidebarOutlineView registerNib:nib forIdentifier:@"menuItemCell"];
    [_sidebarOutlineView setNeedsDisplay:YES];
    
    

}



- (void)_setContentViewToName:(NSString *)name {
    
    
    
    if (_currentContentViewController) {
        [[_currentContentViewController view] removeFromSuperview];
 
    }

    
    
//    if (_subContentViewController) {
//        [[ _subContentViewController view] removeFromSuperview];
//
//    }
//
//    if (_mainContentView) {
//        [_mainContentView  removeFromSuperview];
//    }
//
  
    
    //
    
    
    if ([name isEqualToString:@"TASKLIST"]) {
  
        if (_currentContentViewController) {
            [[_currentContentViewController view] removeFromSuperview];
           
        }
        
        
        _currentContentViewController = [[TaskListViewController alloc] initWithNibName:@"TaskListViewController" bundle:nil];
        
        
       // _currentContentViewController = [[NSViewController alloc] initWithNibName:@"TaskListViewController" bundle:nil]; // Retained
        NSView *view = [_currentContentViewController view];
        view.frame = _mainContentView.bounds;
        [view setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [_mainContentView addSubview:view];
        
        
//        TaskListViewController *taskVC = [[TaskListViewController alloc] init];
//        NSView *view = [taskVC view];
//        view.frame = _mainContentView.bounds;
//        [view setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
//        [_mainContentView addSubview:view];
//
        
        
        
    }
    
    else
    
    
    {
 
        //HHCContactListViewController
        
        _currentContentViewController = [[HHCContactListViewController alloc] initWithNibName:@"HHCContactListViewController" bundle:nil];
        
        
      //  _currentContentViewController = [[NSViewController alloc] initWithNibName:@"ContactsViewController" bundle:nil]; //
        NSView *view = [_currentContentViewController view];
        view.frame = _mainContentView.bounds;
        [view setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [_mainContentView addSubview:view];
        
 
        //SubView
         
        
//        _subContentViewController = [[ContactDetailView alloc] initWithNibName:@"ContactDetailView" bundle:nil];
//
//        NSView *view1 = [_subContentViewController view];
//        view1.frame = _subContentView.bounds;
//        [view1 setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
//        [_subContentView addSubview:view1];
//
   
    

    }
    
 
}


- (void)outlineViewSelectionDidChange:(NSNotification *)notification {
    

    if ([_sidebarOutlineView selectedRow] != -1) {
 
        NSString *item = [_sidebarOutlineView itemAtRow:[_sidebarOutlineView selectedRow]];
        

        if (_selectedsidebarCell) {
            _selectedsidebarCell.layer.backgroundColor  = [[NSColor APP_PURPLE_COLOR] CGColor];
  
        }
        
        
        long selected = [_sidebarOutlineView selectedRow];
        
        _selectedsidebarCell = [_sidebarOutlineView viewAtColumn:0 row:(long)selected makeIfNecessary:YES];
        
        
//        _selectedsidebarCell = [_taskListTable viewAtColumn:0 row:(long)[[notification object] selectedRow] makeIfNecessary:YES];
        _selectedsidebarCell.layer.backgroundColor = [[NSColor APP_TINT_COLOR] CGColor];
        
  
        //TODO: based on text show view
        
       // if ([_sidebarOutlineView parentForItem:item] != nil) {
            // Only change things for non-root items (root items can be selected, but are ignored)
    
            [self _setContentViewToName:item];
        
        
        
        
        
        //}
    }
}



- (CGFloat)outlineView:(NSOutlineView *)outlineView heightOfRowByItem:(id)item {
    
    return 50;
    
    
}




- (NSArray *)_childrenForItem:(id)item {
//    NSArray *children;
//    if (item == nil) {
//        children = _topLevelItems;
//    } else {
//        children = [_childrenDictionary objectForKey:item];
//    }
//    return children;
//
    
    return _topLevelItems;
}





#pragma mark - Outline delegates




- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
    
    return [[self _childrenForItem:item] objectAtIndex:index];
}


- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    
    return NO;
    
//    if ([outlineView parentForItem:item] == nil) {
//        return YES;
//    } else {
//        return NO;
//    }
}


- (NSInteger) outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    return [[self _childrenForItem:item] count];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isGroupItem:(id)item {
    return [_topLevelItems containsObject:item];
}


- (BOOL)selectionShouldChangeInOutlineView:(NSOutlineView *)outlineView{
    
    
    return YES;
    
    
}

- (BOOL)outlineView:(NSOutlineView *)outlineView shouldShowOutlineCellForItem:(id)item {
    // As an example, hide the "outline disclosure button" for FAVORITES. This hides the "Show/Hide" button and disables the tracking area for that row.
    if ([item isEqualToString:@"Favorites"]) {
        return NO;
    } else {
        return YES;
    }
}




//Test




- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item {
    
    
    // For the groups, we just return a regular text view.
    if ([_topLevelItems containsObject:item]) {
        
        
        //TextView
        
//        NSTextField *result = [outlineView makeViewWithIdentifier:@"HeaderTextField" owner:self];
//        // Uppercase the string value, but don't set anything else. NSOutlineView automatically applies attributes as necessary
//        NSString *value = [item uppercaseString];
//        [result setStringValue:value];
//        return result;
        
        
    
       // SidebarTableCellView *result = [outlineView makeViewWithIdentifier:@"MainCell" owner:self];
        
        
        menuItemCell *result = [outlineView makeViewWithIdentifier:@"menuItemCell" owner:self];
    
        NSString *value = [item uppercaseString];
   //     result.textField.textColor = [NSColor redColor];
        
   //     [[result.button cell] setHighlightsBy:0];
     //   result.backgroundStyle =
       // [result setStringValue:value];
  
        result.wantsLayer = YES;
        result.layer.backgroundColor  = [[NSColor APP_PURPLE_COLOR] CGColor];
        result.textField.stringValue = value;
        result.imageView.image = [NSImage imageNamed:value];
        
        
        
        return result;
        
        
        
        
        
    } else  {
        // The cell is setup in IB. The textField and imageView outlets are properly setup.
        // Special attributes are automatically applied by NSTableView/NSOutlineView for the source list
        SidebarTableCellView *result = [outlineView makeViewWithIdentifier:@"MainCell" owner:self];
        result.textField.stringValue = item;
        // Setup the icon based on our section
        id parent = [outlineView parentForItem:item];
        NSInteger index = [_topLevelItems indexOfObject:parent];
        NSInteger iconOffset = index % 4;
        switch (iconOffset) {
            case 0: {
                result.imageView.image = [NSImage imageNamed:NSImageNameIconViewTemplate];
                break;
            }
            case 1: {
                result.imageView.image = [NSImage imageNamed:NSImageNameHomeTemplate];
                break;
            }
            case 2: {
                result.imageView.image = [NSImage imageNamed:NSImageNameQuickLookTemplate];
                break;
            }
            case 3: {
                result.imageView.image = [NSImage imageNamed:NSImageNameSlideshowTemplate];
                break;
            }
        }
        BOOL hideUnreadIndicator = YES;
        // Setup the unread indicator to show in some cases. Layout is done in SidebarTableCellView's viewWillDraw
        if (index == 0) {
            // First row in the index
            hideUnreadIndicator = NO;
            [result.button setTitle:@"42"];
            [result.button sizeToFit];
            // Make it appear as a normal label and not a button
            [[result.button cell] setHighlightsBy:0];
        } else if (index == 2) {
            // Example for a button
            hideUnreadIndicator = NO;
            result.button.target = self;
            result.button.action = @selector(buttonClicked:);
            [result.button setImage:[NSImage imageNamed:NSImageNameAddTemplate]];
            // Make it appear as a button
            [[result.button cell] setHighlightsBy:NSPushInCellMask|NSChangeBackgroundCellMask];
        }
        [result.button setHidden:hideUnreadIndicator];
        return result;
    }
}


- (BOOL)splitView:(NSSplitView *)splitView canCollapseSubview:(NSView *)subview {
    return NO;
}

- (CGFloat)splitView:(NSSplitView *)splitView constrainMinCoordinate:(CGFloat)proposedMinimumPosition ofSubviewAt:(NSInteger)dividerIndex {
    if (proposedMinimumPosition < 75) {
        proposedMinimumPosition = 75;
    }
    return proposedMinimumPosition;
}


//- (id)sourceList:(PXSourceList *)aSourceList child:(NSUInteger)index ofItem:(id)item {
//    <#code#>
//}
//
//- (BOOL)sourceList:(PXSourceList *)aSourceList isItemExpandable:(id)item {
//    <#code#>
//}
//
//- (NSUInteger)sourceList:(PXSourceList *)sourceList numberOfChildrenOfItem:(id)item {
//    <#code#>
//}
//
//- (BOOL)commitEditingAndReturnError:(NSError * _Nullable __autoreleasing * _Nullable)error {
//    <#code#>
//}
//
//- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
//    <#code#>
//}

@end
