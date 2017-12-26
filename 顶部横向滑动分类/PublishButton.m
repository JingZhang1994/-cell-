//
//  PublishButton.m
//  百思不得姐
//
//  Created by zj on 2016/11/28.
//  Copyright © 2016年 zj. All rights reserved.
//

#import "PublishButton.h"
#import "UIView+Extension.h"
@implementation PublishButton
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];

    self.imageView.y = 5;
    self.imageView.centerX = self.frame.size.width*0.5;
    self.titleLabel.width = self.frame.size.width;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.x = 0;
    self.titleLabel.height = self.frame.size.height - self.titleLabel.y-5;


}

@end
