//
//  ChallengeViewController.m
//  pickMyDrink
//
//  Created by Alec Anderson on 3/9/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import "ChallengeViewController.h"

@interface ChallengeViewController ()

@end

@implementation ChallengeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    QuestionManager *manager = [QuestionManager questionManager];
    return manager.challenges.count;
    
}

- (ChallengeCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionManager *manager = [QuestionManager questionManager];
    
    ChallengeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"challengeCell"];
    
    
    if (cell == nil) {
        cell = [[ChallengeCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"challengeCell"];
    }
    
    Challenges *challenge = [manager.challenges objectAtIndex:indexPath.row];
    
    [cell.nameLabel setText:challenge.name];
    NSLog(@"challenge = %@", challenge);
    return cell;
}

#pragma mark - Tableview Data Source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QuestionManager *manager = [QuestionManager questionManager];
    Challenges *challenge  = [manager.challenges objectAtIndex:indexPath.row];
    [manager setCurrentChallenge:challenge];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

@end
