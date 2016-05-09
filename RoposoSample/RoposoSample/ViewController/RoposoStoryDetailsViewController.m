//
//  RoposoStoryDetailsViewController.m
//  RoposoSample
//
//  Created by Divya on 5/7/16.
//  Copyright © 2016 Divya. All rights reserved.
//

#import "RoposoStoryDetailsViewController.h"
#import "UIImageView+RoposoImageViewCategory.h"

@interface RoposoStoryDetailsViewController ()


@end

@implementation RoposoStoryDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Story Details Page", nil);
    self.titleLabel.text=self.storyDetails.title;
    self.descLabel.text=self.storyDetails.storyDesc;
    self.view.backgroundColor = [UIColor whiteColor];
    self.createdOnLabel.text=self.author;
    self.followButton.layer.cornerRadius=4;
    self.screenImage=self.storyDetails.screenImage;
    [self thumbnailImageSetLayout];

   
}

- (void)viewWillAppear:(BOOL)animated{
    if(self.is_followingAuthor)
    {
        
        [self.followButton setTitle:@"Following" forState:UIControlStateNormal];
        self.followButton.enabled=false;
    }
    
}

-(void)thumbnailImageSetLayout{
    
    UIImageView *viewImage=[[UIImageView alloc]init];
    viewImage.image = self.storyDetails.screenImage;
    UIImage *image = viewImage.image;
    UIImage *tempImage = nil;
    CGSize targetSize = CGSizeMake(500,400);
    UIGraphicsBeginImageContext(targetSize);
    CGRect thumbnailRect = CGRectMake(0, 0, 0, 0);
    thumbnailRect.origin = CGPointMake(0.0,0.0);
    thumbnailRect.size.width  = targetSize.width;
    thumbnailRect.size.height = targetSize.height;
    [image drawInRect:thumbnailRect];
    tempImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.thumbnailImage loadImageWithImageURL:self.storyDetails.storyImage];
    self.thumbnailImage.layer.cornerRadius=10;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)followAction:(id)sender {
    
    [self.delegate following:self.storyDetails.db];
    self.followButton.enabled=false;
    [self.followButton setTitle:@"Following" forState:UIControlStateNormal];
    
    
}

@end
