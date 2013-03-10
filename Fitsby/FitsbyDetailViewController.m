//
//  FitsbyDetailViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 2/19/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyDetailViewController.h"
#import "Game.h"

@interface FitsbyDetailViewController ()
- (void)configureView;
@end

@implementation FitsbyDetailViewController

#pragma mark - Managing the detail item

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
        self.profileIV.image = theGame.creatorImage;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailContainer"]) {
        [[segue destinationViewController] setGame:self.game];
    }
}

@end
