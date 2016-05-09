//
//  RoposoStoryDetails.h
//  RoposoSample
//
//  Created by Divya on 5/7/16.
//  Copyright © 2016 Divya. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface RoposoStoryDetails : NSObject


@property (nonatomic, assign) NSUInteger comment_count;
@property (nonatomic, strong) NSString *db;
@property (nonatomic, strong) NSString *storyDesc;
@property (nonatomic, strong) NSString *iD;
@property (nonatomic, strong) NSString *like_flag;
@property (nonatomic, assign) NSUInteger likes_count;
@property (nonatomic, strong) NSString *storyImage;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *verb;
@property (nonatomic,strong) UIImage *screenImage;

- (id)initWithStoryCardDetails:(NSDictionary *)withDetails;
@end
