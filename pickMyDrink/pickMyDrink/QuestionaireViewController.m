//
//  QuestionaireViewController.m
//  pickMyDrink
//
//  Created by Alec Anderson on 3/9/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import "QuestionaireViewController.h"

@interface QuestionaireViewController ()

@end

@implementation QuestionaireViewController

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
    Questions *question = [manager generateQuestion];
    [self.question setText:question.question];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)choiceOneClick:(id)sender {
}
    
- (IBAction)choiceTwoClick:(id)sender {
}
    
- (IBAction)choiceThreeClick:(id)sender {
}
    
- (IBAction)choiceFourClick:(id)sender {
}
@end
