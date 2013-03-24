//
//  LandingViewController.h
//  Fitsby
//
//  Created by Brent Hronk on 2/19/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LandingViewController : UIViewController

/**
 *
 *  cancel
 *
 *  Attempt to unwind segue from either registration onboard or loging page.
 *
 *  @param  segue  The segue which is attempting to be unwound.
 *
 *  @return  Nothing
 */
- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end
