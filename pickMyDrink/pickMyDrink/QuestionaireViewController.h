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
}
    @property (weak, nonatomic) IBOutlet UIButton *choiceOne;
    @property (weak, nonatomic) IBOutlet UIButton *choiceTwo;
    @property (weak, nonatomic) IBOutlet UIButton *choiceThree;
    @property (weak, nonatomic) IBOutlet UIButton *choiceFour;
    @property (weak, nonatomic) IBOutlet UILabel *question;
- (IBAction)choiceOneClick:(id)sender;
- (IBAction)choiceTwoClick:(id)sender;
- (IBAction)choiceThreeClick:(id)sender;
- (IBAction)choiceFourClick:(id)sender;
    
@end
