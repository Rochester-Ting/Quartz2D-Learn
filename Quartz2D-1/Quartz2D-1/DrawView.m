//
//  DrawView.m
//  Quartz2D-1
//
//  Created by 丁瑞瑞 on 22/9/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//
//绘制一条直线
#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect {
//    在drawRect方法里已经创建了图形上下文,不用创建图形上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
//    绘制路径
    UIBezierPath *path = [UIBezierPath bezierPath];
//    设置直线的开头
    [path moveToPoint:CGPointMake(20, 100)];
//    设置直线的终点
    [path addLineToPoint:CGPointMake(200, 200)];
//    将路径添加到图形上下文中
    CGContextAddPath(ref, path.CGPath);
//    绘制到layer上
    CGContextStrokePath(ref);
}
@end
