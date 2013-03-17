//
//  FitsbyRegistrationOnboardViewController.h
//  Fitsby
//
//  Created by Brent Hronk on 3/17/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FitsbyRegistrationOnboardViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) NSMutableArray *modelArray;

@end
