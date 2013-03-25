//
//  FitsbyCreditCardViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 3/15/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyCreditCardViewController.h"
#import "Game.h"

static const int CARD_NUMBER_LENGTH = 16;
static const int EXP_MONTH_LENGTH = 2;
static const int EXP_YEAR_LENGTH = 4;
static const int CVC_LENGTH = 3;

@interface FitsbyCreditCardViewController ()

- (void)configureView;
- (void)configureTags;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNewWager:(int)newWager
{
    NSLog(@"set wager:%d", newWager);
    self.wager = newWager;
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
        //TODO submit data
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
@end
