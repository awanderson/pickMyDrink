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
    //makes bullet points
    NSArray *ingredientsArr = [drink.ingredients componentsSeparatedByString:@";"];

    NSMutableString *ingredients = [@"" mutableCopy];
    NSInteger ingredientCount = 0;
    for(NSString *ingredient in ingredientsArr) {
        if(ingredientCount != 0) {
            [ingredients appendString:@"\n"];
        }
        [ingredients appendString:@"\u2022 "];
        [ingredients appendString:ingredient];
        ingredientCount++;
    }
    [ingredientLabel setText:ingredients ];
    
    NSArray *directionsArr = [drink.directions componentsSeparatedByString:@";"];
    NSMutableString *directions = [@"" mutableCopy];
    NSInteger directionCount = 0;
    for(NSString *direction in directionsArr) {
        if(directionCount != 0) {
            [directions appendString:@"\n"];
            
        }
        [directions appendString:@"\u2022 "];
        [directions appendString:direction];
        directionCount++;
    }
    [directionLabel setText:directions];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
