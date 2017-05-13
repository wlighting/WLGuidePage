//
//  WLNewFeatureController.m
//  0304-1-彩票
//
//  Created by wlighting on 16/3/7.
//  Copyright © 2016年 wlighting. All rights reserved.
//

#import "WLNewFeatureController.h"

#import "WLNewFeatureCell.h"

@interface WLNewFeatureController ()

@property (nonatomic,assign) CGFloat preOffsetX;
@property (nonatomic,strong) UIImageView *animImgV;

@end

@implementation WLNewFeatureController

static NSString * const reuseIdentifier = @"WLCell";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.collectionView registerClass:[WLNewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    
    [self setUp];
    
}
-(void)setUp{
    
    UIImageView *guideLineView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    CGRect guideFrame = guideLineView.frame;
    guideFrame.origin.x -= 150;
    guideLineView.frame = guideFrame;
    [self.collectionView addSubview:guideLineView];

    UIImageView *guide1View = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    CGRect guide1Frame = guide1View.frame;
    guide1Frame.origin.x += 50;
    guide1View.frame = guide1Frame;
    self.animImgV = guide1View;
    [self.collectionView addSubview:guide1View];
    
    UIImageView *guideLargeText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText3"]];
    guideLargeText.center = CGPointMake(self.collectionView.bounds.size.width*0.5, self.collectionView.bounds.size.height*0.7);
    [self.collectionView addSubview:guideLargeText];

    UIImageView *guideSmallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    guideSmallText.center = CGPointMake(self.collectionView.bounds.size.width*0.5, self.collectionView.bounds.size.height*0.8);
    
    [self.collectionView addSubview:guideSmallText];
//
    
}


- (instancetype)init{

    UICollectionViewFlowLayout *flowL = [[UICollectionViewFlowLayout alloc]init];
    flowL.itemSize = [UIScreen mainScreen].bounds.size;
    flowL.minimumLineSpacing = 0;
    flowL.minimumInteritemSpacing = 0;
    flowL.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    return [super initWithCollectionViewLayout:flowL];
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    CGFloat offset = scrollView.contentOffset.x - self.preOffsetX;
    CGRect aniFrame  = self.animImgV.frame;
    aniFrame.origin.x += 2*offset;
    self.preOffsetX = scrollView.contentOffset.x;
    self.animImgV.frame = aniFrame;
    int tag = scrollView.contentOffset.x/self.collectionView.bounds.size.width;
    aniFrame.origin.x -= offset;
    [UIView animateWithDuration:0.5 animations:^{
        
        self.animImgV.frame = aniFrame;
    }];
    self.animImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%zd",tag+1]];

}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WLNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    cell.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%zdBackground568h",indexPath.item + 1]];
    [cell setStartBtnHidden:indexPath withCount:4];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
