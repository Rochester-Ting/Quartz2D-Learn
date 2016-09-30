//
//  ViewController.m
//  图片擦除
//
//  Created by 丁瑞瑞 on 1/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imageV addGestureRecognizer:pan];
}
- (void)pan:(UIPanGestureRecognizer *)pan{
//    获取当前鼠标的位置
    CGPoint curPoint = [pan locationInView:pan.view];
//    设置擦除区域的宽高
    CGFloat wH = 30;
//    设置擦除区域
    CGRect rect = CGRectMake(curPoint.x - wH * 0.5, curPoint.y - wH * 0.5, wH, wH);
//    开启一个问题上下文
    UIGraphicsBeginImageContextWithOptions(self.imageV.bounds.size, NO, 0);
//    将图片渲染到上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.imageV.layer renderInContext:ctx];
//    除去擦除部分
    CGContextClearRect(ctx, rect);
//    生成一张新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    关闭上下文
    UIGraphicsEndImageContext();
    _imageV.image = newImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
