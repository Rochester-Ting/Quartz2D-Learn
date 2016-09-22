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
    [self drawHu:rect];
}
//画弧
- (void)drawHu:(CGRect)rect{
//    ArcCenter:弧的中心
//    radius:圆的半径
//    startAngle:弧开始的角度(水平右侧为0)
//    endAngle:弧结束的角度
//    clockwise:是否是顺时针
//    获取当前view的圆心
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:rect.size.width * 0.5 - 10 startAngle:0 endAngle:-M_PI_2 clockwise:YES];
    [path addLineToPoint:center];
    [path closePath];
    [path stroke];
}
//画圆形
- (void)drawRound{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, 300, 300)];
    [path stroke];
}

//画圆角矩形
- (void)drawRectWithRound{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 100, 100) cornerRadius:50];
    [path stroke];
}
//画矩形
- (void)drawRect{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 200, 200)];
    [path stroke];
}
//画曲线
- (void)drawQu{
    UIBezierPath *path = [UIBezierPath bezierPath];
//    设置起点
    [path moveToPoint:CGPointMake(20, 200)];
    [path addQuadCurveToPoint:CGPointMake(200, 200) controlPoint:CGPointMake(20, 20)];
    [path closePath];
    [path stroke];
}
//画直线
- (void)drawLine{
    //    在drawRect方法里已经创建了图形上下文,不用创建图形上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    //    绘制路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //    设置直线的开头
    [path moveToPoint:CGPointMake(20, 100)];
    //    设置直线的终点
    [path addLineToPoint:CGPointMake(200, 200)];
//    设置线的顶角样式
    CGContextSetLineCap(ref, kCGLineCapRound);
//    设置线的链接样式
    CGContextSetLineJoin(ref, kCGLineJoinRound);
//    设置线的宽度
    CGContextSetLineWidth(ref, 10);
    //    将路径添加到图形上下文中
    CGContextAddPath(ref, path.CGPath);
    //    绘制到layer上
    CGContextStrokePath(ref);
}
@end
