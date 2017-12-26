//
//  HomeOneCollectionViewCell.m
//  O2O
//
//  Created by apple on 2017/12/6.
//  Copyright © 2017年 fanwe. All rights reserved.
//

#import "HomeOneCollectionViewCell.h"
#import "PublishButton.h"
#import "Masonry.h"

@interface HomeOneCollectionViewCell()
@property(nonatomic,strong)PublishButton *but;
@end

@implementation HomeOneCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

-(void)setTitle:(NSString *)title img:(NSString *)img tag:(NSInteger)tag{
    [self addSubview:self.but];
    [self.but mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(0);
        make.bottom.offset(0);

    }];
    _but.tag = tag;
    [_but setTitle:title forState:UIControlStateNormal];
    [_but setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [_but addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)btnClick:(UIButton *)btn{
    if ([_delegate respondsToSelector:@selector(catesOnClickAtion:)]) {
       [_delegate catesOnClickAtion:btn.tag
        ];
    }
}
-(PublishButton *)but{
    if (!_but) {
        _but = [PublishButton buttonWithType:UIButtonTypeCustom];
    }
    return _but;
}

@end
