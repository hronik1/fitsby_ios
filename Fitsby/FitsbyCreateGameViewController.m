//
//  FitsbyCreateGameViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 3/11/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyCreateGameViewController.h"

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

@interface FitsbyCreateGameViewController ()

- (void)initializeLabels;
- (void)initializeSteppers;
- (void)validateGoal;
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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
@end
