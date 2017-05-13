//
//  WLSaveTool.m
//  0304-1-彩票
//
//  Created by wlighting on 16/3/7.
//  Copyright © 2016年 wlighting. All rights reserved.
//

#import "WLSaveTool.h"

@implementation WLSaveTool


+ (NSString *)getCurrentVersion{

    return [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];

}

+ (NSString *)getPreVersion:(NSString *)key{

    return [[NSUserDefaults standardUserDefaults] objectForKey:key];

}

+ (void)saveVersion:(id)curVersion forkey:(NSString *)key{


 [[NSUserDefaults standardUserDefaults] setValue:curVersion forKey:key];

}
//
//- (void)test{
//NSString *preVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"CurVersion"];
//NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
//if ([preVersion isEqualToString:curVersion]) {
//    
//    WLTabBarController *tabBarVC = [[WLTabBarController alloc]init];
//    self.window.rootViewController = tabBarVC;
//}else{
//    
//    WLNewFeatureController *NFVC = [[WLNewFeatureController alloc]init];
//    self.window.rootViewController = NFVC;
//    [[NSUserDefaults standardUserDefaults] setValue:curVersion forKey:@"CurVersion"];
//    
//}
//}
@end
