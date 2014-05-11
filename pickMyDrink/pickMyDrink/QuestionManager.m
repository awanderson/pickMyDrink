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
        
        
        
        //random drink if our point value is zero
        if (self.pointValue == 0) {
            // if we run out of filtered drinks, simply put all the drinks back in filtered drink
            if(filteredDrinks.count == 0) {
                filteredDrinks = [self.drinks mutableCopy];
            }
            
        }
        else
        {
            //if these are the same, we haven't filtered yet
            if(filteredDrinks.count == self.drinks.count) {
                [filteredDrinks removeAllObjects];
                for(int i = 0; i < self.drinks.count; i++) {
                    Drinks *drink = [self.drinks objectAtIndex:i];
                    int drinkPointValue = [drink.pointValue integerValue];
                    if(drinkPointValue == self.pointValue) {
                        [filteredDrinks addObject:drink];
                    }
                }
            } else if (filteredDrinks.count == 0) {
                //add all drinks minus the ones with the right point value because
                //the user has already had all of those
                for(int i = 0; i < self.drinks.count; i++) {
                    Drinks *drink = [self.drinks objectAtIndex:i];
                    int drinkPointValue = (int)drink.pointValue;
                    if(drinkPointValue != self.pointValue) {
                        [filteredDrinks addObject:drink];
                    }
                }
            }
            
        }
        int r = arc4random() % filteredDrinks.count;
        Drinks *drink = [filteredDrinks objectAtIndex:r];
        [filteredDrinks removeObjectAtIndex:r];
        currentDrink = drink;
        return drink;
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
            //get drinks
            NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
            NSEntityDescription *entity = [NSEntityDescription entityForName:@"Drinks" inManagedObjectContext:context];
            [fetchRequest setEntity:entity];
            NSError* error;
            
            //returns an array on success
            manager.drinks = [[context executeFetchRequest:fetchRequest error:&error] mutableCopy];
            manager.unchallengedDrinks = [manager.drinks mutableCopy];
            NSLog(@"count of arr rando = %lu", (unsigned long)manager.drinks.count);
            
            //get questions
            fetchRequest = [[NSFetchRequest alloc] init];
            entity = [NSEntityDescription entityForName:@"Questions" inManagedObjectContext:context];
            [fetchRequest setEntity:entity];
            
            //returns an array on success
            manager.questions = [[context executeFetchRequest:fetchRequest error:&error] mutableCopy];
            
            //get challenges
            fetchRequest = [[NSFetchRequest alloc] init];
            entity = [NSEntityDescription entityForName:@"Challenges" inManagedObjectContext:context];
            [fetchRequest setEntity:entity];
            
            //returns an array on success
            manager.challenges = [[context executeFetchRequest:fetchRequest error:&error] mutableCopy];
            
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

    /*
     * Resets the question manager to default settings, putting all the drinks and questions
     * into the filtered drinks and questions and reseting the point value, should be 
     * called when a new line of questions is asked, or random drink generated
     */
    - (void) resetQuestionManager {
        filteredDrinks = [self.drinks mutableCopy];
        filteredQuestions = [self.questions mutableCopy];
        self.pointValue = 0;
        currentDrink = nil;
    }

    /*
     * sends the current drink that was selected by generateDrink last
     */
    - (Drinks *)getCurrentDrink {
        return currentDrink;
    }

    /*
     * sets the current drink, used by list
     */
    - (void)setCurrentDrink:(Drinks *)drink {
    
        currentDrink = drink;
        
    }

    /*
     * sets the current challenge
     */
    - (void)setCurrentChallenge:(Challenges *)challenge {
        
        currentChallenge = challenge;
        if(challenge != nil && challenge.drinks.count != 0) {
            self.drinks = [[challenge.drinks array] mutableCopy];
        } else {
            self.drinks = self.unchallengedDrinks;
        }
        
    }

    /*
     * gets the current challenge
     */
    - (Challenges *)getCurrentChallenge {
        
        return currentChallenge;
    }

    
@end
