//
//  ViewController.m
//  给屏幕截屏
//
//  Created by 丁瑞瑞 on 30/9/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-  (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    开启位图上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
//    将屏幕界面加载到上下文中
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:ctx];
//    获取一张新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    将图片保存到桌面上
    NSData *data = UIImagePNGRepresentation(newImage);
    [data writeToFile:@"/Users/Rochester/Desktop/tu.png" atomically:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
