//
//  FitsbyPrivateGameViewController.h
//  Fitsby
//
//  Created by Brent Hronk on 3/27/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FitsbyPrivateGameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *creatorField;
@property (weak, nonatomic) IBOutlet UITextField *idField;

/**
 *
 *  doneClicked
 *
 *  Callback for pressing done, searches for the requested game and segues to detail page if found.
 *
 *  @param  sender  The id of what triggered the callback.
 *
 *  @return  Nothing
 */
- (IBAction)doneClicked:(id)sender;

/**
 *
 *  cancelClicked
 *
 *  Callback for pressing cancel, unwinds segue.
 *
 *  @param  sender  Id of what triggered the callback
 *
 *  @return  Nothing
 */
- (IBAction)cancelClicked:(id)sender;

@end
