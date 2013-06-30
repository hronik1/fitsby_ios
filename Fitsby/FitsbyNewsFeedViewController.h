//
//  FitsbyNewsFeed2ViewController.h
//  Fitsby
//
//  Created by Anirudh Balagopal on 28/06/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitsbyNewsFeedTableViewController.h"
@interface FitsbyNewsFeedViewController : UIViewController 
{
    IBOutlet UITableView *chooseNewsFeedTableView;
    IBOutlet UITableView *newsFeedTableView;
    IBOutlet UIScrollView *chooseNewsFeedView;
    FitsbyNewsFeedTableViewController *newsFeedCon;
    IBOutlet UINavigationBar *newFeedNavBar;
    IBOutlet UILabel *gameLabel;
    NSMutableArray *gamesArray;
}
@property(nonatomic, assign) id<UITableViewDelegate> newsFeedCon;

-(IBAction)clickNewsFeedButton:(id)sender;

@end
