//
//  RouletteViewController.h
//  pickMyDrink
//
//  Created by Alec Anderson on 3/9/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Questions.h"
#import "Drinks.h"
#import "QuestionManager.h"
#import "QuestionaireViewController.h"
#import "MainViewController.h"

@interface RouletteViewController : UIViewController {
    QuestionManager *manager;
    __weak IBOutlet UIButton *drinkName;
    UIImageView *box;
}


@property(nonatomic) NSInteger pointValue;
- (IBAction)respin:(id)sender;
- (IBAction)home:(id)sender;

@end
