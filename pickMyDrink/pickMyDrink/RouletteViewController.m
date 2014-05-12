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
    [drinkName setAlpha:0.0];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self displayDrink:[manager generateDrink]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayDrink:(Drinks*)drink {
    [drinkName setTitle:drink.name forState:UIControlStateNormal];
    if (box != nil) {
        box.alpha = 0.0;
    }
    box = [[UIImageView alloc] initWithFrame:CGRectMake(96, -150, 128, 128)];
    UIImage *image = [UIImage imageNamed:drink.imageName];
    [box setImage:image];
    [self.view addSubview:box];
    
    CGRect rect = box.frame;
    rect.origin.y = 200;
    
    [UIView animateWithDuration:.7
                          delay: .5
                        options: UIViewAnimationCurveEaseIn
                     animations:^ {
                         box.frame = rect;
                         
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"done");
                         [UIView animateWithDuration:.7 animations:^(void) {
                             drinkName.alpha = 1.0;
                         }];
                     }
     ];

    
    
}

- (IBAction)respin:(id)sender {
    [self displayDrink:[manager generateDrink]];
}

- (IBAction)home:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
