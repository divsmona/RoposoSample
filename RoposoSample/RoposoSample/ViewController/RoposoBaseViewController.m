//
//  RoposoBaseViewController.m
//  RoposoSample
//
//  Created by Divya on 5/7/16.
//  Copyright © 2016 Divya. All rights reserved.
//

#import "RoposoBaseViewController.h"
#import "RoposoConstant.h"
#import "RoposoStoryAuthor.h"
#import "RoposoStoryDetails.h"
#import "RoposoStoryCardCell.h"
#import "RoposoStoryDetailsViewController.h"
#import "AppDelegate.h"

#define kCellIdentifier @"RoposoStoryCardCell"



@interface RoposoBaseViewController ()
@property (nonatomic, strong) NSArray *authorArray;
@property (nonatomic, strong) NSArray *storycardArray;
@property (weak, nonatomic) IBOutlet UITableView *storyCardListTableView;
@property (nonatomic, strong) NSMutableDictionary *authorNameForId;

@end

@implementation RoposoBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = NSLocalizedString(@"Story List", nil);
    
    self.storyCardListTableView.estimatedRowHeight = 200.0;
    
    //Load data from the json file
    [self loadDataFromJSONFile:JSONFileName];
    
    // Do any additional setup after loading the view from its nib.
    self.following=[[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{

    [self.storyCardListTableView reloadData];
    

}

#pragma mark - UITableView DataSource Methods -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    [self.storyCardListTableView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    return (self.storycardArray && self.storycardArray.count)? self.storycardArray.count:0;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = kCellIdentifier;
  
    RoposoStoryCardCell *storyCardCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!storyCardCell) {
        
        [tableView registerNib:[UINib nibWithNibName:@"RoposoStoryCardCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellIdentifier];
        
        storyCardCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    }
    
    RoposoStoryDetails *storyDetails = [self.storycardArray objectAtIndex:indexPath.row];
    
    // fill  likes and comment count into the cell
    [storyCardCell updateCellWithStoryDetails:storyDetails];
    return storyCardCell;
    
    
}


#pragma mark - UITableView Delegate Methods -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    RoposoStoryDetailsViewController *detailsViewController = [[RoposoStoryDetailsViewController alloc]initWithNibName:@"RoposoStoryDetailsViewController" bundle:[NSBundle mainBundle]];
    detailsViewController.storyDetails = [self.storycardArray objectAtIndex:indexPath.row];
    NSString *authorID= [[NSString alloc]initWithString:detailsViewController.storyDetails.db];//[story valueForKey:@"db"];
    NSString *authorName= [[NSString alloc]initWithString:[self.authorNameForId valueForKey:authorID]];
    detailsViewController.author=authorName;
    detailsViewController.delegate=self;
    if([self.following containsObject:detailsViewController.storyDetails.db ])
        detailsViewController.is_followingAuthor=YES;
    [appDelegate.baseNavController pushViewController:detailsViewController animated:YES];
    
    
}

#pragma mark - Private Methods -
- (void)loadDataFromJSONFile:(NSString *)withFileName {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:withFileName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    //Author Array
    
    NSMutableArray *authorList = [[NSMutableArray alloc]init];
    
    //StoryCard Array
    NSMutableArray *storycardArray= [[NSMutableArray alloc]init];
    NSMutableDictionary *authorNameAndID= [[NSMutableDictionary alloc]init];
    for (int i=0; i<[jsonResponse count]; i++) {
        NSDictionary *jsonDetails = [jsonResponse objectAtIndex:i];
        NSString *userName = jsonDetails[@"username"];
        if (userName)  {
            RoposoStoryAuthor *author = [[RoposoStoryAuthor alloc]initWithAuthorDetails:jsonDetails];
            [authorList addObject:author];
            [authorNameAndID setObject:jsonDetails[@"username"] forKey:jsonDetails[@"id"]];
            
        }
        else {
            RoposoStoryDetails *storyDetail=[[RoposoStoryDetails alloc]initWithStoryCardDetails:jsonDetails];
            [storycardArray addObject:storyDetail];
        }
        
    }
    
    if(authorList && authorList.count)
        self.authorArray=authorList;
    
    if(storycardArray && storycardArray.count)
        self.storycardArray=storycardArray;
    
    if(authorNameAndID.count && authorNameAndID)
        self.authorNameForId=authorNameAndID;
    
    
    [self.storyCardListTableView reloadData];
    
}

#pragma mark -custom delegate method -
-(void)following:(NSString *)str
{
    [self.following addObject:str];

 
}
@end
