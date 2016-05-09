//
//  RoposoStoryAuthor.m
//  RoposoSample
//
//  Created by Divya on 5/7/16.
//  Copyright © 2016 Divya. All rights reserved.
//

#import "RoposoStoryAuthor.h"

@implementation RoposoStoryAuthor
- (id)initWithAuthorDetails:(NSDictionary *)withDetails {
    
    self = [super self];
    if ( self) {
        
        self.about     = withDetails[@"about"];
        self.createdOn = withDetails[@"createdOn"];
        self.followers = [withDetails[@"followers"]integerValue];
        self.following = [withDetails[@"following"]integerValue];
        self.handle    =  withDetails[@"handle"];
        self.iD        =  withDetails[@"iD"];
        self.image     =  withDetails[@"image"];
        self.is_following=withDetails[@"is_following"];
        self.url       =  withDetails[@"url"];
        self.username  =  withDetails[@"username"];
        
    }
    return self;
    
}

@end
