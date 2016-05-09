//
//  RobosoNetOperation.m
//  RoposoSample
//
//  Created by Divya  on 08/05/16.
//  Copyright © 2016 Divya. All rights reserved.
//

#import "RobosoNetOperation.h"

@interface RobosoNetOperation()
@property (nonatomic, strong) NSURLSession *imageDownloadSession;
@property (nonatomic, strong) NSOperationQueue *networkOperationQueue;
@end

@implementation RobosoNetOperation
+ (id)sharedRoposNetOperation {
    
    static RobosoNetOperation *sharedRoposoNetOperation = nil;
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        sharedRoposoNetOperation = [[self alloc]init];
    });
    return sharedRoposoNetOperation;
}

- (id) init {
    self = [super init];
    if (self) {
        _networkOperationQueue = [[NSOperationQueue alloc]init];
        _networkOperationQueue.maxConcurrentOperationCount = 3;
        _networkOperationQueue.name = @"Roposo NetworkOperations";
        
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfiguration.timeoutIntervalForResource = 10;
        sessionConfiguration.HTTPMaximumConnectionsPerHost = 2;
        sessionConfiguration.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
        
        _imageDownloadSession = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:nil  delegateQueue:_networkOperationQueue];
    }
    return self;
}

- (NSURLSessionTask *)imageWithURL:(NSURL *)withImageURL
                           success:(void (^)(NSData *imageData))success
                           failure:(void (^)(NSError *error))failure {
    
    NSURLSessionTask *task = [_imageDownloadSession dataTaskWithURL:withImageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
            return failure(error);
        if (response) {
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                UIImage *image = [UIImage imageWithData:data];
                dispatch_async(dispatch_get_main_queue()
                            , ^{
                                if(image)
                                    success(data);
                            });
                
            });
        }
     }];
    
    [task resume];
    return task;
}
@end
