//
//  ViewController.m
//  给图片截屏
//
//  Created by 丁瑞瑞 on 30/9/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
/** <#注释#>*/
@property (nonatomic,assign) CGPoint startP;
/** <#注释#>*/
@property (nonatomic,strong) UIView *coverView;
@end

@implementation ViewController
- (UIView *)coverView{
    if (!_coverView) {
        _coverView = [[UIView alloc] init];
        _coverView.backgroundColor = [UIColor blackColor];
        _coverView.alpha = 0.7;
        [self.view addSubview:_coverView];
    }
    return _coverView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [_imageV addGestureRecognizer:pan];
}
- (void)pan:(UIPanGestureRecognizer *)pan{
//    获取当前鼠标的位置
    CGPoint curPoint = [pan locationInView:pan.view];
//    判断当前手势的状态
    if (pan.state == UIGestureRecognizerStateBegan) {
//        获取最开始时候的坐标
        _startP = curPoint;
    }else if (pan.state == UIGestureRecognizerStateChanged){
//        设置蒙版的位置
        CGRect rect = CGRectMake(_startP.x, _startP.y, curPoint.x - _startP.x, curPoint.y - _startP.y);
//        开启图片上下文
        self.coverView.frame = rect;
    }else if (pan.state == UIGestureRecognizerStateEnded){
//        开启图片上下文
        UIGraphicsBeginImageContextWithOptions(self.imageV.bounds.size, NO, 0);
//        设置裁剪区域
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.coverView.frame];
        [path addClip];
//        将屏幕上的图片写入上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        [self.imageV.layer renderInContext:ctx];
//        获取一张新的图片
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//        关闭上下文
        UIGraphicsEndImageContext();
        _imageV.image = newImage;
        [self.coverView removeFromSuperview];
    }
}

@end
