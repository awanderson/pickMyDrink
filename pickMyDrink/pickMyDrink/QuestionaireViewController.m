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
    questionNumber=0;
    [super viewDidLoad];
    manager = [QuestionManager questionManager];
    [manager resetQuestionManager];
    [self changeQuestion:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)choiceOneButton:(id)sender {
    NSInteger pointValue = [currentQuestion.answerOnePointValue integerValue];
    [self changeQuestion:pointValue];
}

- (IBAction)choiceTwoButton:(id)sender {
    NSInteger pointValue = [currentQuestion.answerTwoPointValue integerValue];
    [self changeQuestion:pointValue];
}

- (IBAction)choiceThreeButton:(id)sender {
    NSInteger pointValue = [currentQuestion.answerThreePointValue integerValue];
    [self changeQuestion:pointValue];
}

- (IBAction)choiceFourButton:(id)sender {
    NSInteger pointValue = [currentQuestion.answerFourPointValue integerValue];
    [self changeQuestion:pointValue];
}



- (void) changeQuestion:(NSInteger)pointValue
{
    if(questionNumber == 3) {
        UIStoryboard *storyboard = [self storyboard];
        RouletteViewController *rvc = [storyboard instantiateViewControllerWithIdentifier:@"RouletteViewController"];
        [self presentViewController:rvc animated:YES completion:nil];
        
    } else {
        [manager addPoints:pointValue];
        currentQuestion = [manager generateQuestion];
        [questionText setText:currentQuestion.question];
        [choiceOneText setTitle:currentQuestion.answerOne forState:UIControlStateNormal];
        [choiceTwoText setTitle:currentQuestion.answerTwo forState:UIControlStateNormal];
        [choiceThreeText setTitle:currentQuestion.answerThree forState:UIControlStateNormal];
        [choiceFourText setTitle:currentQuestion.answerFour forState:UIControlStateNormal];
        questionNumber = questionNumber + 1;
    }
    
}
@end
