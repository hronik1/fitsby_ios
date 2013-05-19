//
//  FitsbyRegisterViewController.h
//  Fitsby
//
//  Created by Brent Hronk on 2/24/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FitsbyRegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstNameInput;
@property (weak, nonatomic) IBOutlet UITextField *lastNameInput;
@property (weak, nonatomic) IBOutlet UITextField *emailAddressInput;
@property (weak, nonatomic) IBOutlet UITextField *passwordInput;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordInput;

/**
 *
 *  doneClicked
 *
 *  Callback for when the done button is clicked. Performs light validation and attempts to register.
 *
 *  @param  sender  The id of what is responsible for this callback being callled.
 *
 *  @return  Nothing
 */
- (IBAction)doneClicked:(id)sender;

@end
