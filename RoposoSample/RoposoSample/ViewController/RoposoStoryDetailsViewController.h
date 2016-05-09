//
//  RoposoStoryDetailsViewController.h
//  RoposoSample
//
//  Created by Divya on 5/7/16.
//  Copyright © 2016 Divya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoposoStoryDetails.h"
//#import "FollowingAuthor.h"


@protocol FollowingAuthor <NSObject>
-(void)following:(NSString*)str;
@end

@interface RoposoStoryDetailsViewController : UIViewController
- (IBAction)followAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *thumbnailImage;
@property (strong, nonatomic) IBOutlet UILabel *descLabel;
@property (strong, nonatomic) IBOutlet UILabel *createdOnLabel;
@property (strong, nonatomic) IBOutlet UIButton *followButton;
@property (nonatomic, strong) RoposoStoryDetails *storyDetails;
@property (nonatomic,strong) UIImage *screenImage;
@property (nonatomic,strong) NSString *author;
@property id<FollowingAuthor> delegate;
@property BOOL is_followingAuthor;


@end
