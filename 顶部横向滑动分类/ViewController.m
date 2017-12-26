//
//  ViewController.m
//  顶部横向滑动分类
//
//  Created by apple on 2017/12/26.
//  Copyright © 2017年 zj. All rights reserved.
//

#import "ViewController.h"
#import "HomeCateCollectionViewCell.h"
#import "Masonry.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMyView];
}
- (void)initMyView{
    
    [self.view addSubview:self.collectionview];
    [self.collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(0);
        make.bottom.offset(0);
    }];
}


#pragma mark collection view data source

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//设置item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
   return CGSizeMake([UIScreen mainScreen].bounds.size.width,160);
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}
//设置上下左右的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
    
}
//设置最小行的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
   return 0;
}
//设置最小列的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeCateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCateCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

-(UICollectionView *)collectionview{
    if (!_collectionview) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
        _collectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, 0,0) collectionViewLayout:flowlayout];
        _collectionview.delegate = self;
        _collectionview.dataSource = self;
        _collectionview.backgroundColor = [UIColor grayColor];
        [_collectionview registerClass:[HomeCateCollectionViewCell class] forCellWithReuseIdentifier:@"HomeCateCollectionViewCell"];
        _collectionview.showsVerticalScrollIndicator = false;
        
    }
    return _collectionview;
}

@end
