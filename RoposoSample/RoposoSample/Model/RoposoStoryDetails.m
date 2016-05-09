//
//  RoposoStoryDetails.m
//  RoposoSample
//
//  Created by Divya on 5/7/16.
//  Copyright © 2016 Divya. All rights reserved.
//

#import "RoposoStoryDetails.h"

@implementation RoposoStoryDetails
- (id)initWithStoryCardDetails:(NSDictionary *)withDetails {
    
    self = [super self];
    if ( self) {
        self.comment_count      =[withDetails[@"comment_count"]integerValue];
        self.db                 =withDetails[@"db"];
        self.storyDesc          =withDetails[@"description"];
        self.iD                 =withDetails[@"iD"];
        self.like_flag          =withDetails[@"like_flag"];
        self.likes_count        =[withDetails[@"likes_count"]integerValue];
        self.storyImage         =withDetails[@"si"];
        self.title              =withDetails[@"title"];
        self.type               =withDetails[@"type"];
        self.url                =withDetails[@"url"];
        self.verb               =withDetails[@"verb"];
    }
    return self;
    
}

@end
