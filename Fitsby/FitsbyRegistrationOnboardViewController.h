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

/**
 *
 *  doneButtonClicked
 *
 *  The callback which is called when the done button is clicked. Segues to registration when all pages visited.
 *
 *  @param  sender  The id of what is responsible for this callback being callled.
 *
 *  @return  Nothing
 */
- (IBAction)doneButtonClicked:(id)sender;

/**
 *
 *  cancelRegister
 *
 *  Action to unwind segue from Registration page.
 *
 *  @param  segue  The segue which is attempting to be unwound.
 *
 *  @return  Nothing
 */
- (IBAction)cancelRegister:(UIStoryboardSegue *)segue;
@end
