//
//  Questions.h
//  pickMyDrink
//
//  Created by Alec Anderson on 4/10/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Questions : NSManagedObject

@property (nonatomic, retain) NSString * question;
@property (nonatomic, retain) NSString * answer_one;
@property (nonatomic, retain) NSNumber * answer_one_point_value;
@property (nonatomic, retain) NSString * answer_two;
@property (nonatomic, retain) NSNumber * answer_two_point_value;
@property (nonatomic, retain) NSString * answer_three;
@property (nonatomic, retain) NSNumber * answer_three_point_value;
@property (nonatomic, retain) NSString * answer_four;
@property (nonatomic, retain) NSNumber * answer_four_point_value;

@end
