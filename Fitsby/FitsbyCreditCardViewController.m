//
//  FitsbyCreditCardViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 3/15/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyCreditCardViewController.h"
#import "Game.h"
#import "StatusResponse.h"
#import "User.h"
#import "UserApplication.h"
#import "GameCommunication.h"
#import "CreateGameResponse.h"

static const int CARD_NUMBER_LENGTH = 16;
static const int EXP_MONTH_LENGTH = 2;
static const int EXP_YEAR_LENGTH = 4;
static const int CVC_LENGTH = 3;

@interface FitsbyCreditCardViewController () {
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
 * configureTags
 *
 * Helper method to configre tags.
 *
 * @return  Nothing
 */
- (void)configureTags;

/**
 *
 * initializeProgress
 *
 * Helper method to contain all of the initialization information of the spinner.
 *
 * @return  A fully initialized progress spinner
 */
- (UIActivityIndicatorView *)initializeProgress;

/**
 *
 * sendCreditCard
 *
 * Helper method to abstract the details of sending creditcard information.
 *
 * @return  Nothing.
 */
- (void)sendCreditCard;

/**
 *
 * performCreate
 *
 * Helper method to create paid league.
 *
 * @return  StatusResponse  Corresponds to sucess or failure.
 */
- (StatusResponse *)performCreate;

/**
 *
 * performJoin
 *
 * Helper method to join paid league.
 *
 * @return  StatusResponse  Corresponds to sucess or failure.
 */
- (StatusResponse *)performJoin;

@end

@implementation FitsbyCreditCardViewController

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
    [self configureView];
    [self configureTags];
    
    UserApplication *userApplication = (UserApplication *)[UserApplication sharedApplication];
    user = userApplication.user;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNewWager:(int)newWager duration:(int)duration goal:(int)goal isPrivate:(BOOL)isPrivate
{
    NSLog(@"set wager:%d", newWager);
    self.wager = newWager;
    self.duration = duration;
    self.goal = goal;
    self.isPrivate = isPrivate;
    [self configureView];
}

- (void)setNewGame:(Game *)newGame
{
    NSLog(@"setting game");
    self.game = newGame;
    [self configureView];
}

- (void)configureView
{
    if (self.game)
        self.wagerAmountLabel.text = [NSString stringWithFormat:@"$%d",self.game.wager];
    else if (self.wager)
        self.wagerAmountLabel.text = [NSString stringWithFormat:@"$%d",self.wager];
}

- (void)configureTags
{
    NSLog(@"configure tags");
    self.numberField.tag = 0;
    self.monthField.tag = 1;
    self.yearField.tag = 2;
    self.cvcField.tag = 3;
}

- (IBAction)doneClicked:(id)sender {
    NSMutableString *warning = [[NSMutableString alloc] initWithFormat:@""];
    
    if (self.numberField.text.length != CARD_NUMBER_LENGTH)
        [warning appendFormat:@"invalid length:%d\n",self.numberField.text.length];
    if (self.yearField.text.length != EXP_YEAR_LENGTH)
        [warning appendFormat:@"invalid year length:%d\n",self.yearField.text.length];
    if (self.monthField.text.length != EXP_MONTH_LENGTH)
        [warning appendFormat:@"invalid month length:%d\n",self.monthField.text.length];
    if (self.cvcField.text.length != CVC_LENGTH)
        [warning appendFormat:@"invalid cvc length:%d\n",self.cvcField.text.length];
    
    if ([warning isEqual:@""]) {
        [self.view endEditing:YES];
        [self sendCreditCard];
    }
        
    NSLog(@"warning:%@",warning);
    //TODO implement
}

- (IBAction)cancelClicked:(id)sender {
    NSLog(@"cancel clicked");
    [self.view endEditing:YES];
    UINavigationController *parent = [self parentViewController];
    if (self.game) {
        [parent performSegueWithIdentifier:@"cancelJoinGame" sender:self];
    }
    else {
        [parent performSegueWithIdentifier:@"CancelCreditCard" sender:self];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    NSLog(@"delegate entered");
    NSInteger nextTag = textField.tag + 1;
    NSLog(@"tag:%d",textField.tag);
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        NSLog(@"found");
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        NSLog(@"resign");
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}

- (UIActivityIndicatorView *)initializeProgress
{
    UIActivityIndicatorView *progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:progress];
    progress.color = [UIColor redColor];
    progress.center = self.view.center;
    progress.hidesWhenStopped = YES;
    return progress;
}

- (void)sendCreditCard
{
    UIActivityIndicatorView *progress = [self initializeProgress];
    [progress startAnimating];
    
    dispatch_queue_t queue = dispatch_queue_create("fitsby",NULL);
    dispatch_async(queue, ^{
        StatusResponse *response;
        if (self.game) {
            response = [self performJoin];
        } else {
            response = [self performCreate];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [progress stopAnimating];
            if (!response) {
                NSLog(@"null response");
                //TODO alert user
            } else if (!response.successful) {
                NSLog(@"response was not successful");
                //TODO alert user of failure
            } else {
                NSLog(@"success");
                //TODO alert user of success
                //TODO perform segue of some sort
            }
        });
    });
}

- (StatusResponse *)performJoin
{
    NSString *number = self.numberField.text;
    NSString *year = self.yearField.text;
    NSString *month = self.monthField.text;
    NSString *cvc = self.cvcField.text;
    int _id = self.game._id;
    
    StatusResponse *response = [GameCommunication joinGame:user._id gameID:_id cardNumber:number expYear:year expMonth:month cvc:cvc];
    return response;
    
}

- (StatusResponse *)performCreate
{
    NSString *number = self.numberField.text;
    NSString *year = self.yearField.text;
    NSString *month = self.monthField.text;
    NSString *cvc = self.cvcField.text;
    
    StatusResponse *response = [GameCommunication createGame:user._id duration:self.duration isPrivate:self.isPrivate wager:self.wager goal:self.goal cardNumber:number expYear:year expMonth:month cvc:cvc];
    return response;
}

@end
