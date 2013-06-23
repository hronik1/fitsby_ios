//
//  FitsbyCheckinViewController.h
//  Fitsby
//
//  Created by Brent Hronk on 6/23/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FitsbyCheckinViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic, retain) NSDateFormatter *dateFormatter;

@end
