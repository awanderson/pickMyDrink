//
//  DrinkDetailViewController.m
//  pickMyDrink
//
//  Created by Alec Anderson on 5/8/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import "DrinkDetailViewController.h"

@interface DrinkDetailViewController ()

@end

@implementation DrinkDetailViewController

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
	QuestionManager *manager = [QuestionManager questionManager];
    Drinks *drink = [manager getCurrentDrink];
    [drinkName setText:drink.name];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
