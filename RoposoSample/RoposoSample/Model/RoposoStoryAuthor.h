//
//  RoposoStoryAuthor.h
//  RoposoSample
//
//  Created by Divya on 5/7/16.
//  Copyright © 2016 Divya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RoposoStoryAuthor : NSObject
@property (nonatomic, strong) NSString *about;
@property (nonatomic, strong) NSString *createdOn;
@property (nonatomic, assign) NSUInteger followers;
@property (nonatomic, assign) NSUInteger following;
@property (nonatomic, strong) NSString *handle;
@property (nonatomic, strong) NSString *iD;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *is_following;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *username;


- (id)initWithAuthorDetails:(NSDictionary *)withDetails;

@end
