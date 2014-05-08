//
//  RouletteViewController.m
//  pickMyDrink
//
//  Created by Alec Anderson on 3/9/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import "RouletteViewController.h"

@interface RouletteViewController ()

@end

@implementation RouletteViewController

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
    manager = [QuestionManager questionManager];
    [self displayDrink:[manager generateDrink]];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayDrink:(Drinks*)drink {
    [self.drinkLabel setText:drink.name];
}

- (IBAction)respin:(id)sender {
    [self displayDrink:[manager generateDrink]];
}

- (IBAction)resetQuestions:(id)sender {
    UIStoryboard *storyboard = [self storyboard];
    QuestionaireViewController *qvc = [storyboard instantiateViewControllerWithIdentifier:@"QuestionaireViewController"];
    [self presentViewController:qvc animated:YES completion:Nil];
}

- (IBAction)home:(id)sender {
    UIStoryboard *storyboard = [self storyboard];
    MainViewController *mvc = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    [self presentViewController:mvc animated:YES completion:nil
     ];
}
@end
