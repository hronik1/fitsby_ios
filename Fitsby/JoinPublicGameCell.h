//
//  JoinPublicGameCell.h
//  Fitsby
//
//  Created by Brent Hronk on 3/2/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JoinPublicGameCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *profileIV;
@property (strong, nonatomic) IBOutlet UILabel *idLabel;
@property (strong, nonatomic) IBOutlet UILabel *playersLabel;
@property (strong, nonatomic) IBOutlet UILabel *wagerLabel;
@property (strong, nonatomic) IBOutlet UILabel *goalLabel;
@property (strong, nonatomic) IBOutlet UILabel *durationLabel;

@end
