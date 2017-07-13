//
//  HTTPService.h
//  YoutubeCloneObjC
//
//  Created by the Luckiest on 7/12/17.
//  Copyright © 2017 the Luckiest. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSArray * __nullable dataArray, NSString *__nullable errorMsg);

@interface HTTPService : NSObject

+ (id _Nullable ) instance;
- (void) getTutorials:(nullable onComplete)completionHandler;

@end
