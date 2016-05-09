//
//  RobosoNetOperation.h
//  RoposoSample
//
//  Created by Divya  on 08/05/16.
//  Copyright © 2016 Divya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface RobosoNetOperation : NSObject
+ (id)sharedRoposNetOperation;
- (NSURLSessionTask *)imageWithURL:(NSURL *)withImageURL
                           success:(void (^)(NSData *imageData))success
                           failure:(void (^)(NSError *error))failure; 

@end
