//
//  FitsbyDetailViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 2/19/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyDetailViewController.h"
#import "Game.h"
#import "GameCommunication.h"
#import "UserApplication.h"
#import "User.h"
#import "StatusResponse.h"
#import "FitsbyCreditCardViewController.h"

static NSString *const PAY_SEGUE_ID = @"joinPay";

@interface FitsbyDetailViewController () {
    User *user;
}

/**
 *
 * configureView
 *
 * Helper method to configure the view.
 *
 * @return Nothing
 */
- (void)configureView;

/**
 *
 * initializeProgress
 *
 * Helper method to contain all of the initialization information of the spinner.
 *
 * @return A fully initialized progress spinner
 */
- (UIActivityIndicatorView *)initializeProgress;

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
    
    UserApplication *userApplication = (UserApplication *)[UserApplication sharedApplication];
    user = userApplication.user;
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
    } else if ([[segue identifier] isEqualToString:PAY_SEGUE_ID]) {
        // Get destination view
        NSLog(@"segue being prepared oh yeah");
        UINavigationController *vc = [segue destinationViewController];
        FitsbyCreditCardViewController *fitsbyVC = [vc visibleViewController];
        [fitsbyVC setNewGame:self.game];
    }
}

- (IBAction)joinButtonPressed:(id)sender {
    if (self.game.wager == 0) {
        UIActivityIndicatorView *progress = [self initializeProgress];
        [progress startAnimating];
        
        dispatch_queue_t queue = dispatch_queue_create("fitsby",NULL);
        dispatch_async(queue, ^{
            StatusResponse *response = [GameCommunication joinGame:user._id gameID:self.game._id cardNumber:@""
                                expYear:@"" expMonth:@"" cvc:@""];
            dispatch_async(dispatch_get_main_queue(), ^{
                [progress stopAnimating];
                if (!response) {
                    //TODO alert user of failure
                    NSLog(@"response nil");
                } else if (!response.successful) {
                    //TODO alert user of failure
                    NSLog(@"not nil response but failure joining");
                } else {
                    //TODO alert user of success
                    NSLog(@"join success");
                }
            });
        });
    } else {
        [self performSegueWithIdentifier:PAY_SEGUE_ID sender:sender];
    }
}

- (IBAction)cancelJoinGame:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelJoinGame"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

/** private methods **/
- (UIActivityIndicatorView *)initializeProgress {
    UIActivityIndicatorView *progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:progress];
    progress.color = [UIColor redColor];
    progress.center = self.view.center;
    progress.hidesWhenStopped = YES;
    return progress;
}
@end
