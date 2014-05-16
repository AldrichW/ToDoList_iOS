//
//  To_do_listTests.m
//  To-do-listTests
//
//  Created by Aldrich Wingsiong on 2014-04-10.
//  Copyright (c) 2014 Aldrich Wingsiong. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>
#import "ToDoItem.h"
#import "ToDoListTableViewController.h"

@interface To_do_listTests : XCTestCase{
    NSArray *testData;
}


@end

@implementation To_do_listTests

- (void)setUp
{
    [super setUp];
    
    NSBundle *thisBundle = [NSBundle bundleForClass:[self class]];
    NSString *testFile = [thisBundle pathForResource:@"Elements" ofType:@"plist"];
    testData = [[NSArray alloc] initWithContentsOfFile:testFile];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testToDoListObjectCreated
{
    ToDoItem *element = [[ToDoItem alloc] init];

    element.name = @"What the heck is going on bro";
    XCTAssertNotNil(element, @"Wasn't able to allocate To Do List Item");
   
}

- (void)testToDoListNameShortened{
    
    ToDoListTableViewController *newController = [[ToDoListTableViewController alloc]init];
    
    newController.listItems = [[NSMutableArray alloc]init];
    
    ToDoItem *item1 = [[ToDoItem alloc] init];
    item1.name = @"Buy Milk";
    ToDoItem *item2 = [[ToDoItem alloc] init];
    item2.name = @"Code code code";
    ToDoItem *item3 = [[ToDoItem alloc] init];
    item3.name = @"Go to Bed";
    
    [newController.listItems addObject:item1];
    
    [newController.listItems addObject:item2];
    
    [newController.listItems addObject:item3];
    
    XCTAssertEqual([newController.listItems count], 3, @"The number of items displayed should be 3");
    
    
}

@end
