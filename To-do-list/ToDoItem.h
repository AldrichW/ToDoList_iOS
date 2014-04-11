//
//  ToDoItem.h
//  To-do-list
//
//  Created by Aldrich Wingsiong on 2014-04-11.
//  Copyright (c) 2014 Aldrich Wingsiong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString * name;
@property (readonly) NSDate *creationDate;
@property BOOL done;

@end
