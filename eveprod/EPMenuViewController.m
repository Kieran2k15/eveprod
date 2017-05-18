//
//  EPMenuViewController.m
//  eveprod
//
//  Created by Kieran Crawford on 5/16/17.
//  Copyright © 2017 Rotciv Rrama Industries. All rights reserved.
//

#import "EPMenuViewController.h"

@interface EPMenuViewController ()

@property (nonatomic) NSArray <NSArray *> *menuSectionArray;
@property (nonatomic) NSArray <NSString *> *menuSectionNameArray;

@end

typedef enum {
    EPMenuSectionProduction = 0,
    EPMenuSectionSettings,
    EPMenuSectionTotal
} EPMenuSection;

@implementation EPMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self menuSetup];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)menuSetup {
    _menuSectionNameArray = [NSArray arrayWithObjects:@"Production", @"Settings", nil];
    
    NSMutableArray *sections = [NSMutableArray array];
    
    [sections addObject:@[@"Dashboard",
                          @"T2 Production",
                          @"Market Data",
                          ]];
    
    [sections addObject:@[@"API Keys",
                          @"Production",
                          @"Price Import"]];
    
    _menuSectionArray = [NSArray arrayWithArray:sections];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.menuSectionArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.menuSectionArray[section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case EPMenuSectionProduction:
            return self.menuSectionNameArray[EPMenuSectionProduction];
            break;
        case EPMenuSectionSettings:
            return self.menuSectionNameArray[EPMenuSectionSettings];
            break;
        default:
            return @"";
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString *name = @"";
    
    switch (indexPath.section) {
        case EPMenuSectionProduction:
            name = self.menuSectionArray[EPMenuSectionProduction][indexPath.row];
            break;
        case EPMenuSectionSettings:
            name = self.menuSectionArray[EPMenuSectionSettings][indexPath.row];
            break;
        default:
            break;
    }
    
    // Configure the cell...
    cell.textLabel.text = name;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
