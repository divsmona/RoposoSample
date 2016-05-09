//
//  RoposoStoryCardCell.h
//  RoposoSample
//
//  Created by Divya on 5/7/16.
//  Copyright © 2016 Divya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoposoStoryDetails.h"

@interface RoposoStoryCardCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *likesCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentsCountLabel;
@property (strong, nonatomic) IBOutlet UIImageView *likeImage;
@property (strong, nonatomic) IBOutlet UIImageView *commentImage;

- (void)updateCellWithStoryDetails:(RoposoStoryDetails *)withDetails;
- (void)setNeedsLayout;
@end
