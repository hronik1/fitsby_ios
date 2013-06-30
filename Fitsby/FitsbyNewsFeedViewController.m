//
//  FitsbyNewsFeed2ViewController.m
//  Fitsby
//
//  Created by Anirudh Balagopal on 28/06/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyNewsFeedViewController.h"
#import "UserApplication.h"
#import "GameCommunication.h"
#import "User.h"
@interface FitsbyNewsFeedViewController ()

@end

@implementation FitsbyNewsFeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
           }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    chooseNewsFeedTableView.separatorColor = [UIColor whiteColor];
    newFeedNavBar.tintColor=[UIColor colorWithRed:71/255.0 green:177/255.0 blue:222/255.0 alpha:1.0];
    newsFeedCon=[[FitsbyNewsFeedTableViewController alloc] init];
    [newsFeedTableView setDataSource:newsFeedCon];
    [newsFeedTableView setDelegate:newsFeedCon];
    CGRect navframe = [newFeedNavBar frame];
    gameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 320, 40)];
    gameLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickNewsFeedButton)];
    [gameLabel addGestureRecognizer:tapGesture];
    gameLabel.backgroundColor=[UIColor whiteColor];
    gameLabel.textColor=[UIColor whiteColor];
    gameLabel.textAlignment=NSTextAlignmentCenter;
    UIFont *yourFont = [UIFont fontWithName:@"TrebuchetMS-Bold" size:[UIFont systemFontSize]];
    gameLabel.font=yourFont;
    UIColor *altCellColor =[UIColor colorWithRed:71/255.0 green:177/255.0 blue:222/255.0 alpha:1.0];
    gameLabel.backgroundColor=altCellColor;
    UserApplication *userApplication = (UserApplication *)[UserApplication sharedApplication];
    [GameCommunication populateUserGames];
    gamesArray=userApplication.gameArray;
    NSLog(@"Array %@",gamesArray);
    [self.view addSubview:gameLabel];
    if(userApplication.gameID==nil)
    {
        if(gamesArray==nil)
        {
            [GameCommunication populateUserGames];
            
        }
        else
        {
            userApplication.gameID=[gamesArray objectAtIndex:0];

        }
    }
    userApplication.gameID=[NSString stringWithFormat:@"Game : %@",userApplication.gameID];
    gameLabel.text=userApplication.gameID;
   
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadNewsFeedTable) name:@"finishedLoadingGetGameComments" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadNewsFeedTable
{
    [newsFeedTableView reloadData];
}
-(void)clickNewsFeedButton
{
    gameLabel.hidden=YES;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay: 0.0];
    [UIView setAnimationDuration: 1.0];  // one second
    chooseNewsFeedView.hidden=NO;
    CGRect frame = [chooseNewsFeedTableView rectForRowAtIndexPath:0];
    CGFloat cellHeight = frame.size.height*2;
    CGRect navframe = [newFeedNavBar frame];
    chooseNewsFeedView.frame = CGRectMake(0,navframe.size.height, 320,cellHeight);
    [UIView commitAnimations];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [gamesArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
    int gameListId=[[gamesArray objectAtIndex:indexPath.row] intValue];
    [[cell textLabel] setText:[NSString stringWithFormat:@"Game :%d",gameListId]];
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    UIColor *altCellColor =[UIColor colorWithRed:71/255.0 green:177/255.0 blue:222/255.0 alpha:1.0];
    cell.backgroundColor = altCellColor;
    cell.textLabel.textColor=[UIColor whiteColor];
}



@end
