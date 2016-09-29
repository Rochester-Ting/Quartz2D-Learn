//
//  ViewController.m
//  给图片添加水印
//
//  Created by 丁瑞瑞 on 29/9/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self cut];
}
//设置裁剪区域
- (void)cut{
//    获取图片
    UIImage *image = [UIImage imageNamed:@"小黄人"];
//    开启图形上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //    设置裁剪区域
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [path addClip];
//    将图片绘制到图形上下文中
    [image drawAtPoint:CGPointZero];
    //    关闭图形上下文
    UIGraphicsEndImageContext();
//    获取一张新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    _imageV.image = newImage;
    
}
/**
 添加水印
 */
- (void)add{
    UIImage *image = [UIImage imageNamed:@"小黄人"];
    //    开启图形上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //    将图片绘制到imageV上
    [image drawAtPoint:CGPointZero];
    //    绘制文字
    NSString *str = @"@coderDrr";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:50];
    [str drawAtPoint:CGPointMake(50, 50) withAttributes:dict];
    //    生成一张新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //    关闭图形上下文
    UIGraphicsEndImageContext();
    _imageV.image = newImage;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
