//
//  Video.h
//  YoutubeCloneObjC
//
//  Created by the Luckiest on 7/13/17.
//  Copyright © 2017 the Luckiest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *videoDescription;
@property(nonatomic, strong) NSString *iframe;
@property(nonatomic, strong) NSString *thumbnailURL;
@end
