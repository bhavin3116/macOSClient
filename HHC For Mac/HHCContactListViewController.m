//
//  HHCContactListViewController.m
//  HHC For Mac
//
//  Created by Bhavin on 2019-09-03.
//  Copyright © 2019 j2x. All rights reserved.
//

#import "HHCContactListViewController.h"
#import "ContactDetailView.h"
#import <Realm/Realm.h>
#import "RealmContact.h"
#import "ContactListCell.h"
#import "globals.h"
#import "tableRowView.h"




@interface HHCContactListViewController ()
@property (strong) IBOutlet NSTableView *tableView;

@property (strong) IBOutlet NSPopUpButton *sortBylist;


@property (strong) IBOutlet NSPopUpButton *additionalFieldList;


@property (strong) IBOutlet NSTextField *namelable;
@property (strong) IBOutlet NSTextField *companyLabel;

@property (strong) IBOutlet NSTextField *additionalLabel;

//This is the defualt datasource
@property (strong,nonatomic) NSArray *dataSource;
@property (strong,nonatomic) NSMutableArray *listElement;
@property (strong) IBOutlet NSView *buttonBackGround;
@property (strong) IBOutlet NSSplitView *splitView;
@property (strong) ContactListCell *selectedCell;




@end

@implementation HHCContactListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
    [self prepareDataSource];
    
//[_splitView setPosition:position ofDividerAtIndex:dividerIndex];
    
    
    //Contact list
    
    
    [_splitView setPosition:350 ofDividerAtIndex:0];
    [self addDefaultSelected];
    
    
 
    
}

-(void)setupViews {
    
    
    
    
    [_sortBylist addItemsWithTitles:@[@"First Name",@"Last Name",@"Company",@"Department"]];
    
    
    
    NSNib *nib = [[NSNib alloc] initWithNibNamed:@"ContactListCell" bundle:nil];
    [_tableView registerNib:nib forIdentifier:@"contactListCell"];
    [_tableView setNeedsDisplay:YES];
    
    // Do view setup here.
    
    
    _contactListView.wantsLayer = YES;
    _contactListView.layer.backgroundColor = [[NSColor whiteColor] CGColor];
    
    
    self.buttonBackGround.wantsLayer = YES;
    self.buttonBackGround.layer.backgroundColor = [[NSColor APP_TINT_COLOR] CGColor];
    
    
    _tableView.layer.cornerRadius = 0;
    _tableView.layer.borderWidth = 0;
    
//    [_tableView setIntercellSpacing:NSMakeSize(0, 0)];
    
  
    
    
}

-(void)prepareDataSource {
    
    
    
     RLMResults *results = [RealmContact allObjects];
     _listElement = [NSMutableArray array];
    
  
    RLMResults *contactResults = [results objectsWhere:[NSString stringWithFormat:@"flag <> 'D'"]];
    RLMResults *filtered = [contactResults sortedResultsUsingDescriptors:@[[RLMSortDescriptor sortDescriptorWithKeyPath:@"FirstName" ascending:YES],[RLMSortDescriptor sortDescriptorWithKeyPath:@"LastName" ascending:YES]]];

    for (RealmContact *cnt in filtered) {

        [_listElement addObject:cnt];
        
    }

    
//    [_data addObject:[contactResults sortedResultsUsingDescriptors:@[[RLMSortDescriptor sortDescriptorWithKeyPath:@"FirstName" ascending:YES],[RLMSortDescriptor sortDescriptorWithKeyPath:@"LastName" ascending:YES]]]];
    
    
//    _dataSource = [tempData copy];
//    _dataSource = [[NSArray alloc] ini]
    
    
    
}


-(void)addDefaultSelected{
    
     //nil

    if (![_subContentViewController isKindOfClass:[NSViewController class]]) {
 
        
        RealmContact *temp = _listElement[0];
        ContactDetailView *detailView = [[ContactDetailView alloc] initWithNibName:@"ContactDetailView" bundle:nil];
        detailView.rlmContact = temp;
        
        //assign
        
        _subContentViewController = detailView;
        NSView *view = [_subContentViewController view];
        view.frame = _contactDetailView.bounds;
        [view setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [_contactDetailView addSubview:view];
        

        
        
    }
    
   
    
}


#pragma mark Table View


- (NSTableRowView *)tableView:(NSTableView *)tableView rowViewForRow:(NSInteger)row{
    
    
    //for selection but not in use for now
    
    tableRowView *cell = [[tableRowView alloc] init];
    return cell;
    

}



- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {

//    RLMResults *allContacts = [RealmContact allObjects];
//    return allContacts.count;
    
    return _listElement.count;

  //  return 2;
    
    
}



- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{

    
    ContactListCell *cell = [tableView makeViewWithIdentifier:@"contactListCell" owner:self];
    RealmContact *temp = _listElement[row];
    NSString *contacts ;
    
    if (temp.FirstName>0 && temp.LastName>0){
        contacts = [NSMutableString stringWithFormat:@"%@ %@",temp.FirstName,temp.LastName] ;
    }
    else if (temp.FirstName>0){
        contacts = [NSMutableString stringWithFormat:@"%@",temp.FirstName];
    }
    else if (temp.LastName>0){
        contacts = [NSMutableString stringWithFormat:@"%@",temp.LastName];
    }

  
  if (contacts.length>0) {
    
     _namelable.stringValue = contacts;
  }
  else
  
  {
    
    _namelable.stringValue  = @"Test contact";
    
  }
    
 // _namelable.stringValue = contacts;
    _companyLabel.stringValue = temp.Company.length>0?temp.Company:@"";
    _additionalLabel.stringValue = temp.Department.length>0?temp.Department:@"";
  
    
    
    if (row == 0) {

        cell.shadowView.wantsLayer = YES;
        cell.shadowView.layer.backgroundColor = [[NSColor APP_TINT_COLOR] CGColor];
        NSLog(@"Hit shadow");
        
    }
    
    

    return cell;
    
    
}



-(void)tableViewSelectionDidChange:(NSNotification *)notification{
    
    NSLog(@"%ld",(long)[[notification object] selectedRow]);
 
    if (_selectedCell) {
        _selectedCell.shadowView.layer.backgroundColor  = [[NSColor LIGHT_GRAY_COLOR] CGColor];
        _selectedCell.deleteImage.hidden = YES;
        _selectedCell.editImage.hidden = YES;
        
        
    }
    
    _selectedCell = [_tableView viewAtColumn:0 row:(long)[[notification object] selectedRow] makeIfNecessary:YES];
    _selectedCell.shadowView.layer.backgroundColor = [[NSColor APP_TINT_COLOR] CGColor];
    _selectedCell.deleteImage.hidden = NO;
    _selectedCell.editImage.hidden = NO;
    

    
  //  ContactListCell *cell = [_tableView viewAtColumn:0 row:(long)[[notification object] selectedRow] makeIfNecessary:YES];
 //   cell.shadowView.layer.backgroundColor = [[NSColor APP_TINT_COLOR] CGColor];
    
    
    
//    NSInteger selectedRow = [_outlin selectedRow];
//    NSTableRowView *myRowView = [myTableView rowViewAtRow:selectedRow makeIfNecessary:NO];
//    [myRowView setEmphasized:NO];
    
    
    
    if (_subContentViewController) {
       [[_subContentViewController view] removeFromSuperview];

    }

    
    
    RealmContact *temp = _listElement[(long)[[notification object] selectedRow]];
    ContactDetailView *detailView = [[ContactDetailView alloc] initWithNibName:@"ContactDetailView" bundle:nil];
    detailView.rlmContact = temp;
    
    //assign
    
    _subContentViewController = detailView;
    NSView *view = [_subContentViewController view];
    view.frame = _contactDetailView.bounds;
    [view setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [_contactDetailView addSubview:view];

//    NSView *view = [detailView view];
//    view.frame = _contactDetailView.bounds;
//    [view setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
//    [_contactDetailView addSubview:view];
    
    
    
    
//    _subContentViewController = [[ContactDetailView alloc] initWithNibName:@"ContactDetailView" bundle:nil];
//    NSView *view1 = [_subContentViewController view];
//    view1.frame = _contactDetailView.bounds;
//    [view1 setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
//    [_contactDetailView addSubview:view1];

//    _contactDetailView
    
    
}


@end
