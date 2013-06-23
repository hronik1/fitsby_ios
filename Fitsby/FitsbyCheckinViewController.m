//
//  FitsbyCheckinViewController.m
//  Fitsby
//
//  Created by Brent Hronk on 6/23/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyCheckinViewController.h"

@interface FitsbyCheckinViewController () {
    NSTimer *pollingTimer;
}

- (void)pollTime;
@end

@implementation FitsbyCheckinViewController

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
    NSDate *today = [[NSDate alloc] init];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"HH : mm : ss.S"];
    
    NSString *currentTime = [self.dateFormatter stringFromDate: today];
    self.timeLabel.text = currentTime;
    
    pollingTimer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                    target:self
                                                  selector:@selector(pollTime)
                                                  userInfo:nil
                                                   repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)pollTime
{
    NSDate *today = [[NSDate alloc] init];
    NSString *currentTime = [self.dateFormatter stringFromDate: today];
    self.timeLabel.text = currentTime;
}
@end
