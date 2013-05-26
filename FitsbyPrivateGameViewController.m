//
//  FitsbyPrivateGameViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 3/27/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyPrivateGameViewController.h"
#import "User.h"
#import "UserApplication.h"
#import "PrivateGameResponse.h"
#import "GameCommunication.h"

static NSString const *SEGUE_ID = @"privateGameFound";

@interface FitsbyPrivateGameViewController () {
    User *user;
}

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

@implementation FitsbyPrivateGameViewController

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
    UserApplication *userApplication = (UserApplication *)[UserApplication sharedApplication];
    user = userApplication.user;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneClicked:(id)sender {
    NSString *creator = self.creatorField.text;
    NSString *_id = self.idField.text;
    if (!creator.length || !_id.length) {
        NSLog(@"fields not complelete");
        //TODO alert user
        return;
    }
    NSLog(@"%@", _id);
    UIActivityIndicatorView * progress = [self initializeProgress];
    [progress startAnimating];
    dispatch_queue_t queue = dispatch_queue_create("fitsby",NULL);
    dispatch_async(queue, ^{
        PrivateGameResponse *response = [GameCommunication getPrivateGame:_id creatorName:creator userID:user._id];
        dispatch_async(dispatch_get_main_queue(), ^{
            [progress stopAnimating];
            if (!response) {
                //TODO alertUser of failure
                NSLog(@"response nil");
                return;
            } else if (!response.successful) {
                //TODO alert user of failure
                NSLog(@"failure");
                return;
            }
            Game *game = response.game;
            if (!game) {
                //TODO alert user of failure
                NSLog(@"game nil");
            } else {
                
                (NSLog(@"segue initiated"));
                [self performSegueWithIdentifier:SEGUE_ID sender:sender];
            }
        });
        //TODO parse response
    });
}

- (IBAction)cancelClicked:(id)sender {
    
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
