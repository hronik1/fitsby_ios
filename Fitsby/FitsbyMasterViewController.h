//
//  FitsbyMasterViewController.h
//  Fitsby
//
//  Created by Brent Hronk on 2/19/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FitsbyMasterViewController : UITableViewController

/**
 *
 *  cancelAdd
 *
 *  Called to attempt to unwind segue from creating a new game.
 *
 *  @param  segue  The segue which is attempting to be unwound.
 *
 *  @return  Nothing.
 */
- (IBAction)cancelAdd:(UIStoryboardSegue *)segue;

@end
