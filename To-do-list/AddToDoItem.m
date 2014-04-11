//
//  AddToDoItem.m
//  To-do-list
//
//  Created by Aldrich Wingsiong on 2014-04-11.
//  Copyright (c) 2014 Aldrich Wingsiong. All rights reserved.
//

#import "AddToDoItem.h"

@interface AddToDoItem ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation AddToDoItem

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if(sender!=self.doneButton){
        return;
    }
    
    if (self.textField.text.length>0){
        self.item = [[ToDoItem alloc]init];
        self.item.name = self.textField.text;
        self.item.done = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
