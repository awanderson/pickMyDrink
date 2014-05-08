//
//  NSMutableArray+Shuffling.m
//  pickMyDrink
//
//  Created by Alec Anderson on 4/10/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import "NSMutableArray+Shuffling.h"

@implementation NSMutableArray (Shuffling)
    
- (void)shuffle
    {
        NSUInteger count = [self count];
        for (NSUInteger i = 0; i < count; ++i) {
            // Select a random element between i and end of array to swap with.
            NSInteger nElements = count - i;
            NSInteger n = arc4random_uniform(nElements) + i;
            [self exchangeObjectAtIndex:i withObjectAtIndex:n];
        }
    }
    
@end
