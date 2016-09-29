//
//  DrawView.m
//  绘制饼图
//
//  Created by 丁瑞瑞 on 29/9/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect {
    
    NSArray *arr = @[@25,@25,@50];
//    第一个扇形
//    圆心
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
//    半径
    CGFloat radius = rect.size.height * 0.5 - 10;
    CGFloat startA = 0;
    CGFloat endA = 0;
    CGFloat angle = 0;
    for (NSString *str in arr) {
        //    起点
        startA = endA;
        //    终点
        angle = str.integerValue / 100.0 * M_PI * 2;
        endA = startA + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
//        [[UIColor redColor] set];
        [[self randomColor] set];
        [path fill];
    }

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setNeedsDisplay];
}
- (UIColor *)randomColor{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

@end
