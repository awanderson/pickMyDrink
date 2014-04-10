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
@property (nonatomic, retain) NSString * answerOne;
@property (nonatomic, retain) NSNumber * answerOnePointValue;
@property (nonatomic, retain) NSString * answerTwo;
@property (nonatomic, retain) NSNumber * answerTwoPointValue;
@property (nonatomic, retain) NSString * answerThree;
@property (nonatomic, retain) NSNumber * answerThreePointValue;
@property (nonatomic, retain) NSString * answerFour;
@property (nonatomic, retain) NSNumber * answerFourPointValue;

@end
