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
    [self.tableDrinks setSeparatorColor:[UIColor blackColor]];
    
	
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
    QuestionManager *manager = [QuestionManager questionManager];
    return manager.drinks.count;
    
}

- (DrinkCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionManager *manager = [QuestionManager questionManager];
    
    DrinkCell *cell = [tableView dequeueReusableCellWithIdentifier:@"drinkCell"];
    
    
    if (cell == nil) {
        cell = [[DrinkCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"drinkCell"];
    }
    
    Drinks *drink = [manager.drinks objectAtIndex:indexPath.row];
    
    [cell.labelName setText:drink.name];
    
    return cell;
}

#pragma mark - Tableview Data Source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QuestionManager *manager = [QuestionManager questionManager];
    Drinks *drink = [manager.drinks objectAtIndex:indexPath.row];
    [manager setCurrentDrink:drink];
    UIStoryboard *storyboard = [self storyboard];
    DrinkDetailViewController *ddvc = [storyboard instantiateViewControllerWithIdentifier:@"DrinkDetailViewController"];
    [self.navigationController pushViewController:ddvc animated:YES];
    
}

@end
