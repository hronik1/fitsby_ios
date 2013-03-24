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
- (IBAction)durationValueChanged:(id)sender;
- (IBAction)goalValueChanged:(id)sender;
- (IBAction)wagerValueChanged:(id)sender;
- (IBAction)createDoneClicked:(id)sender;
- (IBAction)cancelCreditCard:(UIStoryboardSegue *)segue;

@end
