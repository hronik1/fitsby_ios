//
//  FitsbyChildViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 3/19/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyChildViewController.h"

@interface FitsbyChildViewController ()

@end

@implementation FitsbyChildViewController

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
    self.imageView.image = self.image;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
