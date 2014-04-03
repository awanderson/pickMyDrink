//
//  ListViewController.h
//  pickMyDrink
//
//  Created by Alec Anderson on 3/9/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "DrinkCell.h"

@interface ListViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableDrinks;

@property (weak, nonatomic) NSArray *drinkArr;

@end
