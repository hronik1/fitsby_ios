//
//  FitsbyRegistrationOnboardViewController.h
//  Fitsby
//
//  Created by Brent Hronk on 3/17/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FitsbyRegistrationOnboardViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) NSMutableArray *modelArray;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
- (IBAction)doneButtonClicked:(id)sender;
- (IBAction)cancelRegister:(UIStoryboardSegue *)segue;
@end
