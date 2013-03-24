//
//  FitsbyCreditCardViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 3/15/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyCreditCardViewController.h"

@interface FitsbyCreditCardViewController ()

- (void)configureView;
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

- (void)configureView
{
    if (self.wager)
        self.wagerAmountLabel.text = [NSString stringWithFormat:@"$%d",self.wager];
}
@end
