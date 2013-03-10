//
//  FitsbyDetailContainerViewController.h
//  Fitsby
//
//  Created by Brent Hronk on 3/10/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Game;

@interface FitsbyDetailContainerViewController : UITableViewController
@property (strong, nonatomic) Game *game;
@property (strong, nonatomic) IBOutlet UILabel *idLabel;
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
@property (strong, nonatomic) IBOutlet UILabel *playersLabel;
@property (strong, nonatomic) IBOutlet UILabel *wagerLabel;
@property (strong, nonatomic) IBOutlet UILabel *potLabel;
@property (strong, nonatomic) IBOutlet UILabel *goalLabel;
@property (strong, nonatomic) IBOutlet UILabel *durationLabel;

@end
