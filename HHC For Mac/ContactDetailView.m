//
//  ContactDetailView.m
//  HHC For Mac
//
//  Created by Bhavin on 2019-08-26.
//  Copyright © 2019 j2x. All rights reserved.
//

#import "ContactDetailView.h"
#import "contactViewCell.h"


@interface ContactDetailView ()




@property (strong) IBOutlet NSTableView *_tableView;




//Cell text values

//Cell1
@property (strong) IBOutlet NSTextField *contactName;
@property (strong) IBOutlet NSTextField *department;
@property (strong) IBOutlet NSTextField *titleLabel;

@property (strong) IBOutlet NSTextField *primaryEmail;

@property (strong) IBOutlet NSTextField *personalEmail;

@property (strong) IBOutlet NSTextField *website;

@property (strong) IBOutlet NSTextField *bussinessPhone;

@property (strong) IBOutlet NSTextField *ext;



@property (strong) IBOutlet NSTextField *altPhone;

@property (strong) IBOutlet NSTextField *altExt;

@property (strong) IBOutlet NSTextField *homePhone;
@property (strong) IBOutlet NSTextField *mobilePhone;

@property (strong) IBOutlet NSTextField *fax;

//cell2

@property (strong) IBOutlet NSTextField *workAddress1;
@property (strong) IBOutlet NSTextField *workAddress2;
@property (strong) IBOutlet NSTextField *workAddress3;
@property (strong) IBOutlet NSTextField *workCity;
@property (strong) IBOutlet NSTextField *workState;
@property (strong) IBOutlet NSTextField *workZip;
@property (strong) IBOutlet NSTextField *workCountry;


//cell3
@property (strong) IBOutlet NSTextField *homeAddress1;
@property (strong) IBOutlet NSTextField *homeAddress2;
@property (strong) IBOutlet NSTextField *homeAddress3;
@property (strong) IBOutlet NSTextField *homeCity;
@property (strong) IBOutlet NSTextField *homeState;
@property (strong) IBOutlet NSTextField *homeZip;
@property (strong) IBOutlet NSTextField *homeCountry;



//Cell4

@property (strong) IBOutlet NSTextField *idStatus;
@property (strong) IBOutlet NSTextField *lastResults;

@end




@implementation ContactDetailView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    NSNib *nib = [[NSNib alloc] initWithNibNamed:@"contactViewCell" bundle:nil];
    [__tableView registerNib:nib forIdentifier:@"cell1"];
    [__tableView registerNib:nib forIdentifier:@"cell2"];
    [__tableView registerNib:nib forIdentifier:@"cell3"];
    [__tableView registerNib:nib forIdentifier:@"cell4"];
    [__tableView registerNib:nib forIdentifier:@"cell5"];
    
    
    [__tableView setNeedsDisplay:YES];
    
    
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [[NSColor whiteColor] CGColor];
    
    
    [__tableView reloadData];

    // Do view setup here
    
    
    
    
    
}




#pragma mark Table View



//-(void) noteHeightOfRowsWithIndexesChanged:(NSIndexSet *)indexSet{
//
//
//}


- (void)scrollRowToVisible:(NSInteger)row{
    

    
    
}
- (void)scrollColumnToVisible:(NSInteger)column{
    
    
    
    
}


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
    
    
    //Contact info
    
    
    if (row == 1) {


        return 285;

    }

    //addresses

    if (row == 2 || row == 3) {
        return 244;

    }
    
    //other

    
    return 90;
    
    
    
}




-(void)tableView:(NSTableView *)tableView willDisplayCell:(id)cell forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
   
    
}


//-(void) tableView:(NSTableView *)tableView
//    didAddRowView:(NSTableRowView *)rowView
//           forRow:(NSInteger)row
//{
//    //force update of row height
//    [tableView noteHeightOfRowsWithIndexesChanged:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(row, 1)]];
//
//
//
//}




- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    
    
    // return _myArr.count
    return 5;
    
    
}


- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
 
    if (row == 0) {
   
        contactViewCell *cell = [tableView makeViewWithIdentifier:@"cell1" owner:self];
        NSString *contacts ;
        
        if (_rlmContact.FirstName>0 && _rlmContact.LastName>0){
            contacts = [NSMutableString stringWithFormat:@"%@ %@",_rlmContact.FirstName,_rlmContact.LastName] ;
        }
        else if (_rlmContact.FirstName>0){
            contacts = [NSMutableString stringWithFormat:@"%@",_rlmContact.FirstName];
        }
        else if (_rlmContact.LastName>0){
            contacts = [NSMutableString stringWithFormat:@"%@",_rlmContact.LastName];
        }
        
        _contactName.stringValue = contacts.length>0?contacts:@"Chris Huffman";
        _titleLabel.stringValue = _rlmContact.Title.length>0?_rlmContact.Title:@"President";
        _department.stringValue = _rlmContact.Department.length>0?_rlmContact.Department:@"Administation";

        return cell;
   
        
    }
    if (row == 1) {
        
         contactViewCell *cell = [tableView makeViewWithIdentifier:@"cell2" owner:self];
        _primaryEmail.stringValue = _rlmContact.PrimaryEmailAddress.length>0?_rlmContact.PrimaryEmailAddress:@"chtechone@gmail.com";
        _personalEmail.stringValue = _rlmContact.PersonalEmailAddress.length>0?_rlmContact.PersonalEmailAddress:@"chris@gmail.com";
        _website.stringValue = _rlmContact.webSite.length>0?_rlmContact.webSite:@"www.chtechone.com";
        _bussinessPhone.stringValue = _rlmContact.Phone.length>0?_rlmContact.Phone:@"514.555.3355";
        _ext.stringValue = _rlmContact.Ext.length>0?_rlmContact.Ext:@"221";
        _altPhone.stringValue = _rlmContact.AltPhone.length>0?_rlmContact.AltPhone:@"514.665.8787";
        _altExt.stringValue = _rlmContact.AltExt.length>0?_rlmContact.AltExt:@"201";
        _homePhone.stringValue = _rlmContact.Home_Phone.length>0?_rlmContact.Home_Phone:@"574.785.7877";
        _mobilePhone.stringValue = _rlmContact.MobilePhone.length>0?_rlmContact.MobilePhone:@"584.789.1112";
  

        return cell;
        
    }
    
    
    if (row == 2) {
  
         contactViewCell *cell = [tableView makeViewWithIdentifier:@"cell3" owner:self];
         _workAddress1.stringValue = _rlmContact.Addr1.length>0?_rlmContact.Addr1:@"123";
         _workAddress2.stringValue = _rlmContact.Addr2.length>0?_rlmContact.Addr2:@"sesame street";
         _workAddress3.stringValue = _rlmContact.Addr3.length>0?_rlmContact.MobilePhone:@"#265";
         _workCity.stringValue = _rlmContact.City.length>0?_rlmContact.City:@"Montreal";
         _workState.stringValue = _rlmContact.State.length>0?_rlmContact.State:@"Quebec";
         _workCountry.stringValue = _rlmContact.Country.length>0?_rlmContact.Country:@"Canada";
         _workZip.stringValue = _rlmContact.Zip.length>0?_rlmContact.Zip:@"H6G 9J7";
         return cell;
        
    }
    
    if (row == 3) {

        contactViewCell *cell = [tableView makeViewWithIdentifier:@"cell4" owner:self];
        _homeAddress1.stringValue = _rlmContact.HomeAddress_Line1.length>0?_rlmContact.HomeAddress_Line1:@"123";
        _homeAddress2.stringValue = _rlmContact.HomeAddress_Line2.length>0?_rlmContact.HomeAddress_Line2:@"sesame street";
        _homeAddress3.stringValue = _rlmContact.HomeAddress_Line3.length>0?_rlmContact.HomeAddress_Line3:@"#265";
        _homeCity.stringValue = _rlmContact.HomeAddress_City.length>0?_rlmContact.HomeAddress_City:@"Montreal";
        _homeState.stringValue = _rlmContact.HomeAddress_State.length>0?_rlmContact.HomeAddress_State:@"Quebec";
        _homeCountry.stringValue = _rlmContact.HomeAddress_Country.length>0?_rlmContact.HomeAddress_Country:@"Canada";
        _homeZip.stringValue = _rlmContact.HomeAddress_postalCode.length>0?_rlmContact.HomeAddress_postalCode:@"H6G 9J7";
         return cell;
        
    }
    
    
    if (row == 4) {
        
        
        contactViewCell *cell = [tableView makeViewWithIdentifier:@"cell5" owner:self];
        
        _idStatus.stringValue = _rlmContact.ID_Status.length>0?_rlmContact.ID_Status:@"Customer";
        _lastResults.stringValue = _rlmContact.lastResults.length>0?_rlmContact.lastResults:@"Accepted";

        
         return cell;
        
        
        
        
    }
    

//    else
//
//    {
//
//        NSTableView *cell = [tableView makeViewWithIdentifier:@"workAddressCell" owner:self];
//         return cell;
//    }
//
    
    
    contactViewCell *cell = [tableView makeViewWithIdentifier:@"cell5" owner:self];
    
   return cell;

}

@end
