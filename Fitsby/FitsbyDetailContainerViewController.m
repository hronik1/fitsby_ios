//
//  FitsbyDetailContainerViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 3/10/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyDetailContainerViewController.h"
#import "Game.h"

@interface FitsbyDetailContainerViewController ()

@end

@implementation FitsbyDetailContainerViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setGame:(Game *)newGame
{
    if(_game != newGame) {
        _game = newGame;
    }
    
    [self configureView];
}
- (void)configureView
{
    Game *theGame = self.game;
    if (theGame) {
        NSLog(@"valid game");
        self.idLabel.text = [NSString stringWithFormat:@"%d",theGame._id];
        self.playersLabel.text = [NSString stringWithFormat:@"%d",theGame.players];
        self.wagerLabel.text = [NSString stringWithFormat:@"$%d",theGame.wager];
        self.goalLabel.text = [NSString stringWithFormat:@"%d",theGame.goal];
        self.durationLabel.text = [NSString stringWithFormat:@"%d",theGame.duration];
        self.typeLabel.text = (theGame.isPrivate ? @"Private" : @"Public");
        self.potLabel.text = [NSString stringWithFormat:@"$%d",theGame.wager * theGame.players];
        
    } else {
        NSLog(@"nil game");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
}

@end
