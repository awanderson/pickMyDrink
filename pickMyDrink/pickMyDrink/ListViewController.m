//
//  ListViewController.m
//  pickMyDrink
//
//  Created by Alec Anderson on 3/9/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import "ListViewController.h"
#import "AppDelegate.h"
#import "Drinks.h"

@interface ListViewController ()

@end

@implementation ListViewController

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
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Drinks" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError* error;
    //returns an array on success
    self.drinkArr = [context executeFetchRequest:fetchRequest error:&error];
    NSLog(@"count of arr = %lu", (unsigned long)self.drinkArr.count);
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.drinkArr count];
    
}

- (DrinkCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DrinkCell *cell = [tableView dequeueReusableCellWithIdentifier:@"drinkCell"];
    
    if (cell == nil) {
        cell = [[DrinkCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"drinkCell"];
    }
    
    Drinks *drink = [self.drinkArr objectAtIndex:indexPath.row];
    
    [cell.labelName setText:drink.name];
    
    return cell;
}

#pragma mark - Tableview Data Source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
