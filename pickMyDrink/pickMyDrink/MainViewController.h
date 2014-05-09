//
//  MainViewController.h
//  pickMyDrink
//
//  Created by Alec Anderson on 3/9/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionManager.h"
#import "RouletteViewController.h"

@interface MainViewController : UIViewController {
    
}
- (IBAction)randomButton:(id)sender;

    @property (nonatomic, retain) QuestionManager *manager;
//These are all the buttons to switch pages

@end
