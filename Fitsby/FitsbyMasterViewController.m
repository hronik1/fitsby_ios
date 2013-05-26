//
//  FitsbyMasterViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 2/19/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyMasterViewController.h"
#import "FitsbyDetailViewController.h"
#import "UserApplication.h"
#import "GameCommunication.h"
#import "User.h"
#import "Game.h"
#import "PublicGamesResponse.h"
#import "JoinPublicGameCell.h"

@interface FitsbyMasterViewController () {
    NSMutableArray *_objects;

}

//callback for when the response is finished being fetched from the server
-(void) fetchedGamesResponse:(PublicGamesResponse *)response;
@end

@implementation FitsbyMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"segue started on master side");
    
    UserApplication *userApplication = (UserApplication *)[UserApplication sharedApplication];
    User *user = userApplication.user;
    
    dispatch_queue_t queue = dispatch_queue_create("fitsby",NULL);
    dispatch_async(queue, ^{
        PublicGamesResponse *gamesResponse = [GameCommunication getPublicGames:user._id];
        [self fetchedGamesResponse:gamesResponse];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"joinPublicGameCell";
    
    JoinPublicGameCell *cell = [tableView
                              dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[JoinPublicGameCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:cellIdentifier];
    }
    
    // Configure the cell...
    int row = [indexPath row];
    Game *game = [_objects objectAtIndex:row];
    cell.idLabel.text = [NSString stringWithFormat:@"%d",game._id];
    cell.playersLabel.text = [NSString stringWithFormat:@"%d",game.players];
    cell.wagerLabel.text = [NSString stringWithFormat:@"$%d",game.wager];
    cell.goalLabel.text = [NSString stringWithFormat:@"%d",game.goal];
    cell.durationLabel.text = [NSString stringWithFormat:@"%d",game.duration];
    cell.imageView.image = game.creatorImage;

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Game *game = _objects[indexPath.row];
        [[segue destinationViewController] setGame:game];
    }
}

- (IBAction)cancelAdd:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"CancelAdd"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

/** private method **/
-(void) fetchedGamesResponse:(PublicGamesResponse *)response {
    if (!response) {
        //TODO alert user
        return;
    } else if (!response.games) {
        //TODO log error
        return;
    }
    
    _objects = response.games;
    [self.tableView reloadData];
}


@end
