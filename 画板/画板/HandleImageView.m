//
//  HandleImageView.m
//  画板
//
//  Created by 丁瑞瑞 on 3/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "HandleImageView.h"

@interface HandleImageView()<UIGestureRecognizerDelegate>
/** <#注释#>*/
@property (nonatomic,strong) UIImageView *imageV;
@end
@implementation HandleImageView
- (UIImageView *)imageV{
    if (!_imageV) {
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.frame = self.bounds;
        [self addSubview:imageV];
        _imageV = imageV;
        _imageV.userInteractionEnabled = YES;
        [self addGes];
    }
    return _imageV;
}
- (void)setImage:(UIImage *)image{
    _image = image;
    self.imageV.image = image;
}
- (void)addGes{
    // pan
    // 拖拽手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(pan:)];
    pan.delegate = self;
    [self.imageV addGestureRecognizer:pan];
    
    // pinch
    // 捏合
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    
    pinch.delegate = self;
    [self.imageV addGestureRecognizer:pinch];
    
    
    //添加旋转
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;
    
    [self.imageV addGestureRecognizer:rotation];
    
    // 长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.imageV addGestureRecognizer:longPress];
}
//捏合的时候调用.
- (void)pinch:(UIPinchGestureRecognizer *)pinch
{
    
    pinch.view.transform = CGAffineTransformScale( pinch.view.transform, pinch.scale, pinch.scale);
    // 复位
    pinch.scale = 1;
}


//旋转的时候调用
- (void)rotation:(UIRotationGestureRecognizer *)rotation
{
    // 旋转图片
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    
    // 复位,只要想相对于上一次旋转就复位
    rotation.rotation = 0;
    
}


//长按的时候调用
// 什么时候调用:长按的时候调用,而且只要手指不离开,拖动的时候会一直调用,手指抬起的时候也会调用
- (void)longPress:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        [UIView animateWithDuration:0.25 animations:^{
            self.imageV.alpha = 0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
                self.imageV.alpha = 1;
                UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0);
                CGContextRef ctx = UIGraphicsGetCurrentContext();
                [self.layer renderInContext:ctx];
                UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                [self removeFromSuperview];
                if (_reBlock) {
                    _reBlock(newImage);
                }
            } completion:^(BOOL finished) {
                
            }];
        }];
    }
    
}

//拖动的时候调用
- (void)pan:(UIPanGestureRecognizer *)pan{
    
    CGPoint transP = [pan translationInView:pan.view];
    
    pan.view.transform = CGAffineTransformTranslate(pan.view.transform, transP.x, transP.y);
    //复位
    [pan setTranslation:CGPointZero inView:pan.view];
    
    
}


//能够同时支持多个手势
-(BOOL)gestureRecognizer:(nonnull UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer{
    
    return YES;
}


- (void)drawRect:(CGRect)rect {
}


@end
