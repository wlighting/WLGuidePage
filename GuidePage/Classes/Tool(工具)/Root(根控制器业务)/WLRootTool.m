//
//  WLRootTool.m
//  0304-1-彩票
//
//  Created by wlighting on 16/3/7.
//  Copyright © 2016年 wlighting. All rights reserved.
//

#import "WLRootTool.h"

#import "WLSaveTool.h"
#import "WLNewFeatureController.h"
#import "WLTabBarController.h"

@implementation WLRootTool


+ (UIViewController *)getRootViewController{

    NSString *preVersion = [WLSaveTool getPreVersion:@"CurVersion"];
    NSString *curVersion = [WLSaveTool getCurrentVersion];
    
    if ([preVersion isEqualToString:curVersion]) {
        
        WLTabBarController *tabBatVC = [[WLTabBarController alloc]init];
        return tabBatVC;
        
    }else{
        [WLSaveTool saveVersion:curVersion forkey:@"CurVersion"];
        WLNewFeatureController *newFeatureVC = [[WLNewFeatureController alloc]init];
    
        return newFeatureVC;
        
    }

}


//+ (NSString *)getCurrentVersion;
//+ (NSString *)getPerVersion;
//
//+ (void)saveVersion:(NSString*)curVersion;


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
