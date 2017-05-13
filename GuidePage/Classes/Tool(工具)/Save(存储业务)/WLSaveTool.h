//
//  WLSaveTool.h
//  0304-1-彩票
//
//  Created by wlighting on 16/3/7.
//  Copyright © 2016年 wlighting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLSaveTool : NSObject

+ (NSString *)getCurrentVersion;
+ (NSString *)getPreVersion:(NSString *)key;

+ (void)saveVersion:(id)curVersion forkey:(NSString *)key;


@end
