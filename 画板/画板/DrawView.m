//
//  DrawView.m
//  画板
//
//  Created by 丁瑞瑞 on 2/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "DrawView.h"
#import "RRBezierPath.h"
@interface DrawView ()
/** <#注释#>*/
@property (nonatomic,strong) UIBezierPath *path;
/** <#注释#>*/
@property (nonatomic,strong) NSMutableArray *arrM;
@end
@implementation DrawView
- (NSMutableArray *)arrM{
    if (!_arrM) {
        _arrM = [NSMutableArray array];
    }
    return _arrM;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    _lineW = 1;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint curPoint = [self getCurPoint:touches];
    RRBezierPath *path = [RRBezierPath bezierPath];
    [path moveToPoint:curPoint];
    [self.arrM addObject:path];
    
    [path setLineWidth:_lineW];
    path.color = _lineColor;
    
    _path = path;
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint curPoint = [self getCurPoint:touches];
    [_path addLineToPoint:curPoint];
    [self setNeedsDisplay];
}

- (CGPoint)getCurPoint:(NSSet<UITouch *> *)touches{
    UITouch *touch = [touches anyObject];
    CGPoint curPoint = [touch locationInView:self];
    return curPoint;
}
//清屏
-(void)clear{
    [self.arrM removeAllObjects];
    [self setNeedsDisplay];
    
}
//撤销
-(void)back{
    [self.arrM removeLastObject];
    [self setNeedsDisplay];
    
}
//橡皮擦
-(void)earuse{
    _lineColor = [UIColor whiteColor];
}
//保存
-(void)save{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:ctx];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    NSLog(@"保存成功!");
}


- (void)drawRect:(CGRect)rect {
    for (RRBezierPath *path in self.arrM) {
        [path.color set];
        [path stroke];
    }
}

@end
