//
//  UIImageView+RoposoImageViewCategory.m
//  RoposoSample
//
//  Created by Divya  on 08/05/16.
//  Copyright © 2016 Divya. All rights reserved.
//

#import "UIImageView+RoposoImageViewCategory.h"
#import <objc/runtime.h>
#import "RoposoConstant.h"
#import "RobosoNetOperation.h"

@interface UIImageView(RoposoNetworkProperty)
@property(nonatomic, strong) NSURLSessionTask *task;

@end

@implementation UIImageView (RoposoImageViewCategory)

- (NSURLSessionTask *)task {
    
    return objc_getAssociatedObject(self,
                                    &taskKey);
    
}

- (void)setTask:(NSURLSessionTask *)newTask {
    objc_setAssociatedObject(self,
                             &taskKey,
                             newTask,
                             OBJC_ASSOCIATION_COPY);
}

- (void)setImageWithURL:(NSURL *)withImageURL  placeholderImage:(UIImage *)placeholder {
    
    self.image = placeholder;
    RobosoNetOperation *operation = [RobosoNetOperation sharedRoposNetOperation];
    NSURLSessionTask *imageDownloadTask = [operation imageWithURL:withImageURL success:^(NSData *imageData) {
        
        self.image = [UIImage imageWithData:imageData];
        NSError *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        NSArray *documetsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSString *docsDir = [documetsPath objectAtIndex:0];
        
        NSString *appDirectory = [docsDir stringByAppendingPathComponent:kRoposoImageFolderName];
        
        //Checking for directory existence and creating if not already exists
        if(![fileManager fileExistsAtPath:appDirectory]) {
            [fileManager createDirectoryAtPath:appDirectory withIntermediateDirectories:NO attributes:nil error:&error];
        }
        
        appDirectory =  [appDirectory stringByAppendingFormat:@"/%@",[withImageURL lastPathComponent]];
        
        if([fileManager fileExistsAtPath:appDirectory])
            NSLog([fileManager removeItemAtPath:appDirectory error:&error]?@"deleted":@"not deleted");
        
        [imageData writeToFile:appDirectory atomically:YES];
        
    } failure:^(NSError *error) {
        NSLog(@"Image downlod error =%@", error);
    }];
    self.task = imageDownloadTask;
    
}

- (void)cancelDownload {
    [self.task cancel];
}

/** Method to load image to imageview - for the specified image url
 @param withImageURL: Represents the URL for the image*/
- (void)loadImageWithImageURL:(NSString *)withImageURL {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *tempArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [tempArray objectAtIndex:0];
    NSString *appDir = [docsDir stringByAppendingPathComponent:kRoposoImageFolderName];
    NSString *filePath = [appDir stringByAppendingPathComponent:[withImageURL lastPathComponent]];
    
    BOOL isFileExists = [fileManager fileExistsAtPath:filePath];
    
    if (isFileExists)
        self.image = [UIImage imageWithContentsOfFile:filePath];
    else
        [self setImageWithURL:[NSURL URLWithString:withImageURL] placeholderImage:nil];
    
}

@end
