//
//  QuestionaireViewController.h
//  pickMyDrink
//
//  Created by Alec Anderson on 3/9/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionManager.h"
#import "Questions.h"

@interface QuestionaireViewController : UIViewController {
    QuestionManager *manager;
    Questions *currentQuestion;
    __weak IBOutlet UILabel *questionText;
    __weak IBOutlet UIButton *choiceOneText;
    __weak IBOutlet UIButton *choiceTwoText;
    __weak IBOutlet UIButton *choiceThreeText;
    __weak IBOutlet UIButton *choiceFourText;
}

- (IBAction)choiceOneButton:(id)sender;
- (IBAction)choiceTwoButton:(id)sender;
- (IBAction)choiceThreeButton:(id)sender;
- (IBAction)choiceFourButton:(id)sender;

@end
