//
//  HomeCateCollectionViewCell.m
//  O2O
//
//  Created by apple on 2017/12/26.
//  Copyright © 2017年 fanwe. All rights reserved.
//

#import "HomeCateCollectionViewCell.h"
#import "HomeOneCollectionViewCell.h"
#import "Masonry.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface HomeCateCollectionViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,HomeOneCollectionViewCellDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)NSArray *ti;
@end

@implementation HomeCateCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _ti = @[@"豪华酒店",@"特色客栈",@"经济实用",@"钟点房",@"豪华酒店",@"特色客栈",@"经济实用",@"钟点房",@"豪华酒店",@"特色客栈",@"经济实用",@"钟点房",@"豪华酒店",@"特色客栈",@"经济实用",@"钟点房"];

        [self addSubview:self.collectionView];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.offset(0);
        }];
        [self addSubview:self.pageControl];
        [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(0);
            make.centerX.equalTo(self.mas_centerX);
        }];
    }
    return self;
}
//===========重点方法：要想改变一行显示个数只需用整屏的宽/个数====================
//设置item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.frame.size.width/4, 70);
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _ti.count;
}
#pragma mark 按钮的点击方法
-(void)catesOnClickAtion:(NSInteger)tag{
    NSLog(@"被点击了，臭猪宝🐷");
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//设置最小行的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
     return 0;
    
}
//设置最小列的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//设置上下左右的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 10, 0);
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeOneCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeOneCollectionViewCell" forIndexPath:indexPath];
    cell.delegate = self;
    [cell setTitle:_ti[indexPath.row] img:@"箱包" tag:indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

//cell滑动结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView  {
    self.pageControl.currentPage = self.collectionView.contentOffset.x/WIDTH;

}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
        flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowlayout];
        [_collectionView registerClass:[HomeOneCollectionViewCell class] forCellWithReuseIdentifier:@"HomeOneCollectionViewCell"];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
    }
    return _collectionView;
}
-(UIPageControl *)pageControl{
    if (_pageControl==nil) {
        _pageControl = [[UIPageControl alloc]init];
        NSInteger pagescount = _ti.count/8;
        _pageControl.numberOfPages = pagescount;
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        
    }
    return _pageControl;
}
@end
