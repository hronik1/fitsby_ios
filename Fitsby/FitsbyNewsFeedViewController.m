//
//  FitsbyNewsFeedViewController.m
//  Fitsby
//
//  Created by Anirudh Balagopal on 26/06/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyNewsFeedViewController.h"
#import "UserApplication.h"
#import "GameCommunication.h"

@interface FitsbyNewsFeedViewController ()

@end

@implementation FitsbyNewsFeedViewController

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
    NSLog(@"NewsFeed View Loaded");
    
    
    UserApplication *userApplication = (UserApplication *)[UserApplication sharedApplication];
    userApplication.gameID = [NSString stringWithFormat:@"356"];
    
    NSString *feedGameID=userApplication.gameID;
    
    NSDictionary *feedResponse=[GameCommunication getGameComments:feedGameID];
    if(feedResponse==nil)
    {
        NSLog(@"Error loading newsFeed");
    }
    
    for (id key in feedResponse) {
        
        if([key isEqualToString:@"all_comments"])
        {
            
            NSMutableArray *feedsArray;
            feedsArray=[feedResponse objectForKey:key];
            userApplication.feedArray=feedsArray;
        }
    }

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
    
    UserApplication *userApplication = (UserApplication *)[UserApplication sharedApplication];
    UITableViewCell *cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
    NSDictionary *feedObject=[userApplication.feedArray objectAtIndex:[indexPath row]];
    for(id feedKey in feedObject)
    {
       if([feedKey isEqualToString:@"message"])
       {
           [[cell textLabel] setText:[feedObject objectForKey:feedKey]];
       }
    }
   
    
    return cell;
}


@end
