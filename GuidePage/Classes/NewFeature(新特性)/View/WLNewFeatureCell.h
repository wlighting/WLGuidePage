//
//  WLNewFeatureCell.h
//  0304-1-彩票
//
//  Created by wlighting on 16/3/7.
//  Copyright © 2016年 wlighting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLNewFeatureCell : UICollectionViewCell

@property (nonatomic,strong) UIImage *image;

- (void)setStartBtnHidden:(NSIndexPath *)indexPath withCount:(int)count;

@end
