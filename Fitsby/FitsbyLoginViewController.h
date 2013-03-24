//
//  FitsbyLoginViewController.h
//  Fitsby
//
//  Created by Brent Hronk on 2/21/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FitsbyLoginViewController : UITableViewController
<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailAddressInput;
@property (weak, nonatomic) IBOutlet UITextField *passwordInput;

/**
 *
 *  doneClicked
 *
 *  Callback or the done button being clicked. Perform light validation and login.
 *
 *  @param  sender  The id of what is responsible for this callback being callled.
 *
 *  @return  Nothing
 */
- (IBAction)doneClicked:(id)sender;

@end
