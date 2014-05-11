//
//  MainViewController.m
//  pickMyDrink
//
//  Created by Alec Anderson on 3/9/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    self.manager = [QuestionManager questionManager];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    Challenges *challenge = [self.manager getCurrentChallenge];
    if(challenge != Nil) {
        [challengeLabel setText:challenge.name];
        challengeView.hidden = FALSE;
    } else {
        challengeView.hidden = TRUE;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)randomButton:(id)sender {
    [self.manager resetQuestionManager];
    UIStoryboard *storyboard = [self storyboard];
    RouletteViewController *rvc = [storyboard instantiateViewControllerWithIdentifier:@"RouletteViewController"];
    [self.navigationController pushViewController:rvc animated:YES];
    
}

- (IBAction)removeChallengeButton:(id)sender {
    [self.manager setCurrentChallenge:Nil];
    challengeView.hidden = TRUE;
}
@end
