//
//  LandingViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 2/19/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "LandingViewController.h"

@interface LandingViewController ()

@end

@implementation LandingViewController

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    //TODO possible implement
//    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
//        [self dismissViewControllerAnimated:YES completion:NULL];
//    }
}

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
