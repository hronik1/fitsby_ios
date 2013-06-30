//
//  FitsbyNewsFeedCell.m
//  Fitsby
//
//  Created by Anirudh Balagopal on 29/06/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FitsbyNewsFeedCell.h"

@implementation FitsbyNewsFeedCell
@synthesize nameLabel = nameLabel;
@synthesize comment = comment;
@synthesize thumbnailImageView = thumbnailImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
