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

@end
