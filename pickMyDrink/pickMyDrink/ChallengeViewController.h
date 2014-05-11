//
//  ChallengeViewController.h
//  pickMyDrink
//
//  Created by Alec Anderson on 3/9/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChallengeCell.h"
#import "QuestionManager.h"
#import "Challenges.h"

@interface ChallengeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableChallenge;

@end
