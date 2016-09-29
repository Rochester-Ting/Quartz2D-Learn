//
//  DrawView.m
//  绘制文字和图片
//
//  Created by 丁瑞瑞 on 29/9/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect {
//    绘制文字
//    [self drawStr:rect];
//    绘制图片
    [self drawImage:rect];
}

/**
 绘制图片
 */
- (void)drawImage:(CGRect)rect{
    UIImage *image = [UIImage imageNamed:@"黄人"];
    //    裁剪区域图片(必须在绘制之前裁剪)
    UIRectClip(CGRectMake(20, 20, 100, 100));
    // drawInrect和drawAtPoint的区别:drawInrect是在区域内绘制,图片的大小会调整,drawAtPoint保持图片的大小
    [image drawInRect:rect];
//    [image drawAtPoint:CGPointZero];
//    drawAsPatternInRect:如果图片很小,图片会保持图片的大小,并且平铺整个rect区域
//    [image drawAsPatternInRect:rect];

}

/**
 绘制文字
 */
- (void)drawStr:(CGRect)rect{
    NSString *str = @"大帅比瑞瑞";
    // drawInrect和drawAtPoint的区别:drawInrect实在区域内绘制,如果文字过长会自动换行,drawAtPoint是从某一个点开始,文字过程不会自动换行
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //设置文字的大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:50];
    //设置文字的颜色
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    //设置文字的描边
    dict[NSStrokeColorAttributeName] = [UIColor greenColor];
    dict[NSStrokeWidthAttributeName] = @3;
    //设置阴影
    NSShadow *shadow = [[NSShadow alloc] init];
    //设置阴影的偏移量,往右10,往下10
    shadow.shadowOffset = CGSizeMake(10, 10);
    //设置阴影的颜色
    shadow.shadowColor = [UIColor blueColor];
    //设置阴影的模糊效果
    shadow.shadowBlurRadius = 3;
    dict[NSShadowAttributeName] = shadow;
    
    [str drawInRect:rect withAttributes:dict];
//    [str drawAtPoint:CGPointZero withAttributes:nil];
}
@end
