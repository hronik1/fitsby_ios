//
//  FitsbyNewsFeedCell.h
//  Fitsby
//
//  Created by Anirudh Balagopal on 29/06/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FitsbyNewsFeedCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *comment;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
