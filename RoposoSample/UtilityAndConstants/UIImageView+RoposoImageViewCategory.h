//
//  UIImageView+RoposoImageViewCategory.h
//  RoposoSample
//
//  Created by Divya  on 08/05/16.
//  Copyright © 2016 Divya. All rights reserved.
//


#import <UIKit/UIKit.h>
static char const * const taskKey = "TaskKey";

@interface UIImageView (RoposoImageViewCategory)

- (void)loadImageWithImageURL:(NSString *)withImageURL;
- (void)setImageWithURL:(NSURL *)withImageURL  placeholderImage:(UIImage *)placeholder;
- (void)cancelDownload;

@end
