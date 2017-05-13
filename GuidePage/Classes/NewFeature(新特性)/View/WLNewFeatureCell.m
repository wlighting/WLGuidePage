//
//  WLNewFeatureCell.m
//  0304-1-彩票
//
//  Created by wlighting on 16/3/7.
//  Copyright © 2016年 wlighting. All rights reserved.
//

#import "WLNewFeatureCell.h"
#import "WLTabBarController.h"

@interface WLNewFeatureCell ()

@property (nonatomic,strong) UIImageView *imageV;
@property (nonatomic,weak) UIButton *startBtn;

@end

@implementation WLNewFeatureCell

-(UIImageView *)imageV{

    if (_imageV == nil) {
        
        _imageV = [[UIImageView alloc]init];
        _imageV.frame = self.bounds;
        [self.contentView addSubview:_imageV];
        
    }

    return _imageV;

}

- (UIButton *)startBtn{
    if (_startBtn == nil) {
        
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];

    [btn sizeToFit];
    btn.center = CGPointMake(self.frame.size.width*0.5, self.bounds.size.height*0.7);
    _startBtn = btn;
    [btn addTarget:self action:@selector(startGo) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
        
    }
    return _startBtn;
}


- (void)startGo{
    
    WLTabBarController *tabarController = [[WLTabBarController alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabarController;

}
- (void)setStartBtnHidden:(NSIndexPath *)indexPath withCount:(int)count{

    if (indexPath.item == count-1) {
        self.startBtn.hidden = NO;
    }else{
    
        self.startBtn.hidden = YES;
    }

}


-(void)setImage:(UIImage *)image{
    _image = image;
    self.imageV.image = image;
  
}








@end
