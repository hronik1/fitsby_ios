//
//  FitsbyRegistrationOnboardViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 3/17/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyRegistrationOnboardViewController.h"

@interface FitsbyRegistrationOnboardViewController ()

@end

@implementation FitsbyRegistrationOnboardViewController

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
    self.pageViewController = [[UIPageViewController alloc]
                               initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                               navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                               options:nil];
    self.modelArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"registration_onboard1.png"],
                       [UIImage imageNamed:@"registration_onboard2.png"], [UIImage imageNamed:@"registration_onboard3.png"],
                       [UIImage imageNamed:@"registration_onboard4.png"], [UIImage imageNamed:@"registration_onboard5.png"],
                       nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
