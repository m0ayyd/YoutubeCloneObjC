//
//  ViewController.m
//  YoutubeCloneObjC
//
//  Created by the Luckiest on 7/12/17.
//  Copyright © 2017 the Luckiest. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "Video.h"
#import "VideoCell.h"
#import "VideoVC.m"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *videoList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.videoList = [[NSArray alloc]init];
    
    [[HTTPService instance] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errorMsg) {
        if(dataArray) {
            
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(NSDictionary *d in dataArray) {
                Video *vid = [[Video alloc] init];
                vid.title = d[@"title"];
                vid.videoDescription = d[@"description"];
                vid.iframe = d[@"iframe"];
                vid.thumbnailURL = d[@"thumbnail"];
                [arr addObject:vid];
            }
            self.videoList = arr;
            [self updateTableData];
        } else if(errorMsg) {
            NSLog(@"%@", errorMsg);
        }
    }];
}

- (void) updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoCell *cell = (VideoCell *)[tableView dequeueReusableCellWithIdentifier:@"VideoCell"];
    if(!cell) {
        cell = [[VideoCell alloc] init];
     }
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    Video *video = self.videoList[indexPath.row];
    VideoCell *vidCell = (VideoCell *)cell;
    [vidCell configure:video];
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Video *video = self.videoList[indexPath.row];
    [self performSegueWithIdentifier:@"VideoVC" sender:video];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoList.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    VideoVC *videoVC = (VideoVC *)segue.destinationViewController;
    videoVC.video = (Video *)sender;
}


@end
