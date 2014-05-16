//
//  ToDoListTableViewController.m
//  To-do-list
//
//  Created by Aldrich Wingsiong on 2014-04-11.
//  Copyright (c) 2014 Aldrich Wingsiong. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItem.h"
#import "AddToDoItem.h"

@interface ToDoListTableViewController ()



@end

@implementation ToDoListTableViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue{
    AddToDoItem *sourceView = [segue sourceViewController];
    
    ToDoItem *newItem = sourceView.item;
    
    if (newItem!=nil){
        [self.listItems addObject:newItem];
        [self.tableView reloadData];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.listItems = [[NSMutableArray alloc] init];
    
   // [self loadInitialData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    //This is set to 1 to indicate only one section on the table.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.listItems count];
}

- (void) loadInitialData{
    
    ToDoItem *item1 = [[ToDoItem alloc] init];
    item1.name = @"Buy Milk";
    ToDoItem *item2 = [[ToDoItem alloc] init];
    item2.name = @"Code code code";
    ToDoItem *item3 = [[ToDoItem alloc] init];
    item3.name = @"Go to Bed";
    
    [self.listItems addObject:item1];
    [self.listItems addObject:item2];
    [self.listItems addObject:item3];
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIndentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary* attributes = @{
                                 NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]
                                 };
    ToDoItem *item = [self.listItems objectAtIndex:indexPath.row];
    
    NSAttributedString* attrText = [[NSAttributedString alloc] initWithString:item.name attributes:attributes];
    
    cell.textLabel.text = item.name;
    
    if (item.done){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.backgroundColor = [UIColor grayColor];
        
        cell.textLabel.attributedText = attrText;
        
        

    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.backgroundColor = [UIColor clearColor];
        
        cell.textLabel.text = item.name;
        
    }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ToDoItem *tappedItem = [self.listItems objectAtIndex:indexPath.row];
    tappedItem.done = !tappedItem.done;
    
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];

    

    
}


@end
