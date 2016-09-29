//
//  DrawView.m
//  绘制加载进度条
//
//  Created by 丁瑞瑞 on 29/9/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView
- (void)setValue:(CGFloat)value{
    _value = value;
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect {
//    圆心:ArcCenter
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
//    半径:radius
    CGFloat radius = rect.size.height * 0.5 - 10;
//    开始的角度
    CGFloat startA = - M_PI_2;
//    结束的角度
    CGFloat endA = - M_PI_2 + _value * M_PI * 2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [path stroke];
}


@end
