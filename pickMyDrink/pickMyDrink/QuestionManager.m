//
//  QuestionManager.m
//  pickMyDrink
//
//  Created by Alec Anderson on 4/10/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import "QuestionManager.h"

@implementation QuestionManager

    - (Drinks *) generateDrink {
        return [self.drinks objectAtIndex:1];
    }
    
    
    
    /**
     * Randomely returns a question
     * and removes it from the question arr
     */
    
    - (Questions *) generateQuestion {
        
        int r = arc4random() % filteredQuestions.count;
        Questions *q = [filteredQuestions objectAtIndex:r];
        [filteredQuestions removeObjectAtIndex:r];
        return q;
    }
    
    /**
     * Shuffles and returns an array of drinks
     *
     */
    - (NSMutableArray *) generateRandomDrinks {
        NSMutableArray *shuffledDrinks = [self.drinks mutableCopy];
        [shuffledDrinks shuffle];
        return shuffledDrinks;
    }
    
    /*
     * Singleton class to get the instance of
     * question manager
     */
    + (id)questionManager {
        static QuestionManager *manager = nil;
        static dispatch_once_t onceToken;
        
        dispatch_once(&onceToken, ^{
            manager = [[self alloc] init];
            AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
            NSManagedObjectContext *context = [appDelegate managedObjectContext];
            NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
            NSEntityDescription *entity = [NSEntityDescription entityForName:@"Drinks" inManagedObjectContext:context];
            [fetchRequest setEntity:entity];
            NSError* error;
            
            //returns an array on success
            manager.drinks = [[context executeFetchRequest:fetchRequest error:&error] mutableCopy];
            NSLog(@"count of arr rando = %lu", (unsigned long)manager.drinks.count);
            
            
            fetchRequest = [[NSFetchRequest alloc] init];
            entity = [NSEntityDescription entityForName:@"Questions" inManagedObjectContext:context];
            [fetchRequest setEntity:entity];
            
            //returns an array on success
            manager.questions = [[context executeFetchRequest:fetchRequest error:&error] mutableCopy];
            manager.pointValue = 0;
        });
        
        return manager;
    }
    
    /*
     * Simple call to add the points from a question to running total
     */
    
    - (void)addPoints:(NSInteger) points {
        self.pointValue = self.pointValue + points;
    }

    - (int) getPoints {
        return self.pointValue;
    }

    - (void) resetQuestionManager {
        filteredDrinks = self.drinks;
        filteredQuestions = self.questions;
        self.pointValue = 0;
    }
    
@end
