//
//  DrawView.m
//  雪花的定时器效果
//
//  Created by 丁瑞瑞 on 29/9/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView
- (void)awakeFromNib{
    [super awakeFromNib];
//    设置定时器
    _snowY = 0;
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateLink)];

    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}
- (void)updateLink{
    _snowY += 5;
    if (_snowY > [UIScreen mainScreen].bounds.size.height) {
        _snowY = 0;
    }
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"雪花"];
    [image drawAtPoint:CGPointMake(0, _snowY)];
}


@end
