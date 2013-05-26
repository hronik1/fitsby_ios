//
//  FitsbyCreateGameViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 3/11/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyCreateGameViewController.h"
#import "User.h"
#import "UserApplication.h"
#import "CreateGameResponse.h"
#import "GameCommunication.h"
#import "FitsbyCreditCardViewController.h"

//wager consants
static int DEFAULT_WAGER = 0;
static int MIN_WAGER = 0;
static int STEP_WAGER = 1;

//duration constatnts
static int DEFAULT_DURATION = 7;
static int MIN_DURATION = 7;
static int MAX_DURATION = 28;
static int STEP_DURATION = 7;

//goal constants
static int DEFAULT_GOAL = 4;
static int MIN_GOAL_PER_DURATION_STEP = 4;
static int STEP_GOAL = 1;

//Segue constants
static NSString *const FREE_SEGUE_ID = @"//TODO"; //TODO
static NSString *const PAY_SEGUE_ID = @"creditCard";

@interface FitsbyCreateGameViewController () {
    User *user;
}

/**
 *
 * initializeLabels
 *
 * Helper method to abstact initializing the label text.
 *
 * @return Nothing
 */
- (void)initializeLabels;

/**
 *
 * initializeSteppers
 *
 * Helper method to avstract the initialization of the steppers.
 *
 * @return Nothing.
 */
- (void)initializeSteppers;

/**
 *
 * validateGoal
 *
 * Helper callback that will change the stepper values to ensure 
 * goals and duration are properly related.
 *
 * @return Nothing
 */
- (void)validateGoal;

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

@implementation FitsbyCreateGameViewController

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
    [self initializeLabels];
    [self initializeSteppers];
    
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
    NSLog(@"entered preparing segue");
    if ([[segue identifier] isEqualToString:PAY_SEGUE_ID]) {
        // Get destination view
        NSLog(@"segue being prepared oh yeah");
        UINavigationController *vc = [segue destinationViewController];
        FitsbyCreditCardViewController *fitsbyVC = [vc visibleViewController];
        [fitsbyVC setNewWager:self.wagerStepper.value duration:self.durationStepper.value goal:self.goalStepper.value isPrivate:self.privateSwitch.on];
    }
}
/** action implementations **/
- (IBAction)durationValueChanged:(id)sender {
    int tempDuration = self.durationStepper.value;
    self.duration.text = [NSString stringWithFormat:@"%d", tempDuration];
    
    [self validateGoal];
}

- (IBAction)goalValueChanged:(id)sender {
    [self validateGoal];
}

- (IBAction)wagerValueChanged:(id)sender {
    int tempWager = self.wagerStepper.value;
    self.wager.text = [NSString stringWithFormat:@"$%d", tempWager];
    
}

- (IBAction)createDoneClicked:(id)sender {
    if (self.wagerStepper.value == 0) {
        NSLog(@"zero stepper value");
        UIActivityIndicatorView *progress = [self initializeProgress];
        
        dispatch_queue_t queue = dispatch_queue_create("fitsby",NULL);
        dispatch_async(queue, ^{
            CreateGameResponse *response = [GameCommunication createGame:user._id duration:self.durationStepper.value isPrivate:self.privateSwitch.on wager:self.wagerStepper.value goal:self.goalStepper.value cardNumber:@"" expYear:@"" expMonth:@"" cvc:@""];
            dispatch_async(dispatch_get_main_queue(), ^{
                [progress stopAnimating];
                if (!response) {
                    //TODO alert user of failure
                    NSLog(@"create game response is nil");
                } else if (!response.successful) {
                    //TODO alert user of failure
                    NSLog(@"response not nil, but failed");
                } else {
                    //TODO alert user of success
                    NSLog(@"success, game id:%d", response.gameID);
                }
            });
        });
    } else {
        //TODO send stuff to next view controller
        NSLog(@"nonzero wager value");
        [self performSegueWithIdentifier:PAY_SEGUE_ID sender:sender];
    }
}

- (IBAction)cancelCreditCard:(UIStoryboardSegue *)segue{
    if ([[segue identifier] isEqualToString:@"CancelCreditCard"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}
/** private methods **/
- (void)initializeLabels {
    self.duration.text = [NSString stringWithFormat:@"%d",DEFAULT_DURATION];
    self.goal.text = [NSString stringWithFormat:@"%d",DEFAULT_GOAL];
    self.wager.text = [NSString stringWithFormat:@"$%d",DEFAULT_WAGER];
}

- (void)initializeSteppers {
    self.durationStepper.minimumValue = MIN_DURATION;
    self.durationStepper.maximumValue = MAX_DURATION;
    self.durationStepper.stepValue = STEP_DURATION;
    self.durationStepper.wraps = NO;
    self.durationStepper.continuous = YES;
    self.durationStepper.autorepeat = YES;
    
    self.goalStepper.minimumValue = DEFAULT_GOAL;
    self.goalStepper.maximumValue = MIN_DURATION;
    self.goalStepper.stepValue = STEP_GOAL;
    self.goalStepper.wraps = NO;
    self.goalStepper.continuous = YES;
    self.goalStepper.autorepeat = YES;
    
    self.wagerStepper.minimumValue = MIN_WAGER;
    self.wagerStepper.stepValue = STEP_WAGER;
    self.wagerStepper.wraps = NO;
    self.wagerStepper.continuous = YES;
    self.wagerStepper.autorepeat = YES;
}

- (void)validateGoal {
    int tempDuration = self.durationStepper.value;
    int minGoal = (MIN_GOAL_PER_DURATION_STEP * tempDuration / STEP_DURATION);
    int tempGoal = self.goalStepper.value;
    self.goalStepper.minimumValue = minGoal;
    self.goalStepper.maximumValue = tempDuration;
    if (tempGoal <= minGoal) {
        self.goal.text = [NSString stringWithFormat:@"%d", minGoal];
        self.goalStepper.value = minGoal;
    } else if (tempGoal >= tempDuration) {
        self.goal.text = [NSString stringWithFormat:@"%d", tempDuration];
        self.goalStepper.value = tempDuration;
    } else {
        self.goal.text = [NSString stringWithFormat:@"%d",tempGoal];
        self.goalStepper.value = tempGoal;
    }
}

- (UIActivityIndicatorView *)initializeProgress {
    UIActivityIndicatorView *progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:progress];
    progress.color = [UIColor redColor];
    progress.center = self.view.center;
    progress.hidesWhenStopped = YES;
    return progress;
}

@end
