//
//  RoposoStoryCardCell.m
//  RoposoSample
//
//  Created by Divya on 5/7/16.
//  Copyright © 2016 Divya. All rights reserved.
//

#import "RoposoStoryCardCell.h"
#import "UIImageView+RoposoImageViewCategory.h"

@implementation RoposoStoryCardCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellWithStoryDetails:(RoposoStoryDetails *)withDetails {
    self.titleLabel.text = withDetails.title;
    self.commentsCountLabel.text = [NSString stringWithFormat:@"%ld", withDetails.comment_count];
    self.likesCountLabel.text = [NSString stringWithFormat:@"%ld", withDetails.likes_count];
    self.thumbnailImageView.layer.cornerRadius = 10;
    self.thumbnailImageView.layer.masksToBounds = YES;
    [self.thumbnailImageView loadImageWithImageURL:withDetails.storyImage];
    
    
  //  UIImageView *viewImage=[[UIImageView alloc]init];
  //  viewImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:withDetails.storyImage]]];
   
     
   /*
    with NSUrlSession: images are showing after a delay. And not corresponding to the story
    for eg: 1 picture showing at 4 places.
    
    
    
    
    
    
    */
  /*  NSURL *url = [NSURL URLWithString:withDetails.storyImage];
    
 
    NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession]
                                                   downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                                
                                                      self.thumbnailImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
                                                   }];
    
   
    [downloadPhotoTask resume];
    */
    
    
     [self.likeImage setImage:[UIImage imageNamed:@"likeImage"]];
     [self.commentImage setImage:[UIImage imageNamed:@"commentImage"]];
    
    
}


-(void)setNeedsLayout{


    UIImage *image = self.thumbnailImageView.image;
    UIImage *tempImage = nil;
    CGSize targetSize = CGSizeMake(80,60);
    UIGraphicsBeginImageContext(targetSize);
    
    CGRect thumbnailRect = CGRectMake(0, 0, 0, 0);
    thumbnailRect.origin = CGPointMake(0.0,0.0);
    thumbnailRect.size.width  = targetSize.width;
    thumbnailRect.size.height = targetSize.height;
    
    [image drawInRect:thumbnailRect];
    
    tempImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.thumbnailImageView.image = tempImage;
    self.thumbnailImageView.layer.cornerRadius=10;

}


- (void)loadImageWithURL:(NSString *)withURL {
    
    
}

- (void)downloadImageWithURL:(NSString *)withURL {
    
    
}

@end
