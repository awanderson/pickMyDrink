//
//  DrinkDetailViewController.h
//  pickMyDrink
//
//  Created by Alec Anderson on 5/8/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drinks.h"
#import "QuestionManager.h"

@interface DrinkDetailViewController : UIViewController {
    
    __weak IBOutlet UILabel *drinkName;
    __weak IBOutlet UILabel *ingredientLabel;
    __weak IBOutlet UILabel *directionLabel;
}

@end
