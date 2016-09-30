//
//  ViewController.m
//  带边框的图片裁剪
//
//  Created by 丁瑞瑞 on 30/9/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"阿狸头像"];
//    边框的宽度
    CGFloat wH = 10;
    //    开启位图上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.width + 2 * wH, image.size.height + 2 * wH), NO, 0);
//    添加边框
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width + 2 * wH, image.size.height + 2 * wH)];
//    设置颜色
    [[UIColor redColor]set];
    [path fill];

//    设置裁剪边框
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(wH, wH, image.size.width, image.size.height)];
    [path addClip];
//    将图片写入位图上下文
    [image drawAtPoint:CGPointMake(wH, wH)];
//    获取新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    关闭位图上下文
    UIGraphicsEndImageContext();
//    设置到图片上
    _imageV.image = newImage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
