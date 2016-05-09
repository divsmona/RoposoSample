//
//  RoposoBaseViewController.h
//  RoposoSample
//
//  Created by Divya on 5/7/16.
//  Copyright © 2016 Divya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoposoStoryDetailsViewController.h"



@interface RoposoBaseViewController : UIViewController<FollowingAuthor>
@property (nonatomic,strong) NSMutableArray *following;
@end
