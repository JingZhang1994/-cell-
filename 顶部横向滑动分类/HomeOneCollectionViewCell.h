//
//  HomeOneCollectionViewCell.h
//  O2O
//
//  Created by apple on 2017/12/6.
//  Copyright © 2017年 fanwe. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol HomeOneCollectionViewCellDelegate <NSObject>
@required

- (void)catesOnClickAtion:(NSInteger)tag;

@end

@interface HomeOneCollectionViewCell : UICollectionViewCell

@property (nonatomic, assign) id<HomeOneCollectionViewCellDelegate> delegate;

-(void)setTitle:(NSString *)title img:(NSString *)img tag:(NSInteger)tag;

@end
