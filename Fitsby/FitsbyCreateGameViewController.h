//
//  FitsbyCreateGameViewController.h
//  Fitsby
//
//  Created by Brent Hronk on 3/11/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FitsbyCreateGameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *privateSwitch;
@property (weak, nonatomic) IBOutlet UIStepper *durationStepper;
@property (weak, nonatomic) IBOutlet UIStepper *goalStepper;
@property (weak, nonatomic) IBOutlet UIStepper *wagerStepper;
@property (weak, nonatomic) IBOutlet UILabel *duration;
@property (weak, nonatomic) IBOutlet UILabel *goal;
@property (weak, nonatomic) IBOutlet UILabel *wager;

/**
 *
 *  durationValueChanged
 *
 *  Callback for changing the duration value.
 *
 *  @param  sender  The id of what is responsible for this callback being callled.
 *
 *  @return  Nothing
 */
- (IBAction)durationValueChanged:(id)sender;

/**
 *
 *  goalValueChanged
 *
 *  Callback for changing the goal value.
 *
 *  @param  sender  The id of what is responsible for this callback being callled.
 *
 *  @return  Nothing
 */
- (IBAction)goalValueChanged:(id)sender;

/**
 *
 *  wagerValueChanged
 *
 *  Callback for changing the wager value.
 *
 *  @param  sender  The id of what is responsible for this callback being callled.
 *
 *  @return  Nothing
 */
- (IBAction)wagerValueChanged:(id)sender;

/**
 *
 *  createDoneClicked
 *
 *  Callback for clicking the done button. Either creates game or sends to credit card page.
 *
 *  @param  sender  The id of what is responsible for this callback being callled.
 *
 *  @return  Nothing
 */
- (IBAction)createDoneClicked:(id)sender;

/**
 *
 *  cancelCreditCard
 *
 *  Attempts to unwind segue from the credit card page.
 *
 *  @param  segue  The segue which is attempting to be unwound.
 *
 *  @return  Nothing
 */
- (IBAction)cancelCreditCard:(UIStoryboardSegue *)segue;

@end
