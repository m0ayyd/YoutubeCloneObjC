//
//  VideoCell.h
//  YoutubeCloneObjC
//
//  Created by the Luckiest on 7/13/17.
//  Copyright © 2017 the Luckiest. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoCell : UITableViewCell
- (void) configure:(nonnull Video *)video;
@end
