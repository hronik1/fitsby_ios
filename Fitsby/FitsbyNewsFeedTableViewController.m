//
//  FitsbyNewsFeedViewController.m
//  Fitsby
//
//  Created by Anirudh Balagopal on 26/06/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyNewsFeedTableViewController.h"
#import "UserApplication.h"
#import "GameCommunication.h"
#import "LandingViewController.h"
#import "UserCommunication.h"
#import "FitsbyNewsFeedCell.h"
#import "FeedCell.h"
@interface FitsbyNewsFeedTableViewController ()

@end

@implementation FitsbyNewsFeedTableViewController

-(id)init
{
    self=[super init];
    UserApplication *userApplication = (UserApplication *)[UserApplication sharedApplication];
    if(userApplication.gameID==nil)
    {
        [GameCommunication populateUserGames];
    }
    NSString *feedGameID=[userApplication.gameArray objectAtIndex:0];
    [GameCommunication getGameComments:feedGameID];
    return self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    UserApplication *userApplication = (UserApplication *)[UserApplication sharedApplication];
    return [userApplication.feedArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
  
    static NSString *simpleTableIdentifier = @"newsFeedTableCell";
    
    FitsbyNewsFeedCell *cell = (FitsbyNewsFeedCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"newsFeedTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    UserApplication *userApplication = (UserApplication *)[UserApplication sharedApplication];
    FeedCell *feedObject=[userApplication.feedArray objectAtIndex:[indexPath row]];
    
    [[cell nameLabel] setText:feedObject.firstName];
            
    [[cell comment] setText:feedObject.message];
            
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}
-(IBAction)loginButtonClicked:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    LandingViewController *viewControl = (LandingViewController *)[storyboard instantiateViewControllerWithIdentifier:@"landingView"];
    [UserCommunication logoutUser];
    [self presentViewController:viewControl animated:YES completion:NULL];
   

}

@end
