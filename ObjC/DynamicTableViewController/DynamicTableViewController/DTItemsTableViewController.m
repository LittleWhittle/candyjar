//
//  DTItemsTableViewController.m
//  DynamicTableViewController
//
//  Created by Manoharan Velayutham on 8/10/17.
//  Copyright © 2017 Manoharan Velayutham. All rights reserved.
//

#import "DTItemsTableViewController.h"

@interface DTItemsTableViewController ()

@property(nonatomic, strong) NSArray<NSArray *> * sections;
@property(nonatomic, strong) NSArray<NSString *> * zeroSectionRows;
@property(nonatomic, strong) NSArray<NSString *> * oneSectionRows;
@property(nonatomic, strong) NSArray<NSString *> * twoSectionRows;
@property(nonatomic, strong) NSArray<NSString *> * moreTextSectionRows;
@end

@implementation DTItemsTableViewController

#pragma mark - View lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"My Custom Title";
    self.zeroSectionRows = @[@"ABC", @"DEF", @"GHJ"];
    self.oneSectionRows = @[@"123", @"456"];
    self.twoSectionRows = @[@"Ahhh", @"Oops", @"Crazy", @"Whisper", @"Murmur", @"Calm"];
    self.moreTextSectionRows = @[@"abcdefghijklmnopqrstwvxyz abcdefghijklmnopqrstwvxyz abcdefghijklmnopqrstwvxyz abcdefghijklmnopqrstwvxyz abcdefghijklmnopqrstwvxyz", @"09876543210987654321 0987654321 0987654321 0987654321 0987654321 0987654321 0987654321",
                                 @"Well Lets have a fun. Its good to see you son. Wish you many more Happy returns of the day. Bro, Is this your car?. Yes, bro. Where did you buy this?. Bro I found this in last week. Alright, lets have some fun. I repeat this sentence. Please keep your mind and body in peaceful state. Talk to yourself and listen to your inner voice. "];
    self.sections = @[self.zeroSectionRows, self.oneSectionRows, self.twoSectionRows, self.moreTextSectionRows];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // You need to set this to design and use self sized cell. Its nothing but build custom cell with your desired custom views. Make sure you setup proper constraints adjust your layout based on content.
    self.tableView.estimatedRowHeight = 90;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%s %d", __FUNCTION__ , __LINE__);
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return [[self.sections objectAtIndex:section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray * eachSection = [self.sections objectAtIndex:indexPath.section];
    if (eachSection == self.moreTextSectionRows) {
        return [self tableView:tableView detailCellForRowAtIndexPath:indexPath];
    }
    else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DTItemIdentifier" forIndexPath:indexPath];
        NSString * detailText = [eachSection objectAtIndex:indexPath.row];
        // Configure the cell...
        cell.textLabel.text = [NSString stringWithFormat:@"Row %lu", (unsigned long)indexPath.row];
        cell.detailTextLabel.text = detailText;
        return cell;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView detailCellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *detailCell = [tableView dequeueReusableCellWithIdentifier:@"DTSelfSizeIdentifier" forIndexPath:indexPath];
    NSArray * eachSection = [self.sections objectAtIndex:indexPath.section];
    NSString * detailText = [eachSection objectAtIndex:indexPath.row];
    UIView * customView = [detailCell.contentView viewWithTag:30];
    UILabel * customLabel = [customView viewWithTag:0];
    if (customLabel) {
        customLabel.numberOfLines = 0;
        customLabel.text = detailText;
    }
    
    return detailCell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"SECTION %lu", (unsigned long)section];
}

/*
// ???: For some reason this method is called only for section 1. Please find the reason.
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    static NSString * headerFooterViewIdentifier = @"DTheaderFooterViewIdentifier";
//    UITableViewHeaderFooterView * headerView = nil;
//    
//    NSString * titleText = @"DEFAULT";
//    if ([self.sections objectAtIndex:section] == self.zeroSectionRows) {
//        titleText = @"SECTION ZERO";
//    }
//    else {
//        titleText = @"SECTION ONE";
//    }
//
//    headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterViewIdentifier];
//    
//    if (!headerView) {
//        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:headerFooterViewIdentifier];
//        headerView.contentView.backgroundColor = [UIColor purpleColor];
//        headerView.textLabel.textColor = [UIColor yellowColor];
//    }
//    
//        headerView.textLabel.text = titleText;
//
//    return headerView;
//} */


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    BOOL canEditRow = YES;
    
    // Don't allow user to edit 1st section
    if ([self.sections objectAtIndex:indexPath.section] == self.zeroSectionRows) {
        canEditRow = NO;
    }
    
    // Return NO if you do not want the specified item to be editable.
    return canEditRow;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if ([self.sections objectAtIndex:indexPath.section] == self.zeroSectionRows) {
//        
//    }
//}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }   
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    BOOL canMoveRow = YES;
    // Don't allow user to edit 1st section
    if ([self.sections objectAtIndex:indexPath.section] == self.zeroSectionRows) {
        canMoveRow = NO;
    }

    return canMoveRow;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
