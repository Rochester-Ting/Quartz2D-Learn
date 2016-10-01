//
//  ClockView.m
//  手势解锁
//
//  Created by 丁瑞瑞 on 1/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ClockView.h"

@interface ClockView ()
/** 可变数组,包含选中的按钮*/
@property (nonatomic,strong) NSMutableArray *btnMuArray;
/** 鼠标所在的位置*/
@property (nonatomic,assign) CGPoint curPoint;
@end
@implementation ClockView
- (NSMutableArray *)btnMuArray{
    if (!_btnMuArray) {
        _btnMuArray = [NSMutableArray array];
    }
    return _btnMuArray;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setUp];
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}
#pragma mark - 设置按钮
- (void)setUp{
    for (int i = 0; i < 9; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        btn.userInteractionEnabled = NO;
        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        [self addSubview:btn];
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
//    按钮的宽高
    CGFloat btnWH = 60;
//    列数
    int lieNum = 3;
//    间距
    CGFloat MarginX = (self.frame.size.width - btnWH * lieNum) / (lieNum + 1);
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat curLie = 0;
    CGFloat curLine = 0;
//    设置按钮的frame
    for (int i = 0; i < self.subviews.count; i++) {
//        获取按钮的列
        curLie = i % lieNum;
//        获取当前按钮所在行数
        curLine = i / lieNum;
//        btnX = MarginX * (curLie + 1) + btnWH * curLie;
//        btnY = MarginX * (curLine + 1) + btnWH * curLine;
        btnX = MarginX + (MarginX + btnWH) * curLie;
        btnY = (MarginX +btnWH) * curLine;
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(btnX, btnY, btnWH, btnWH);
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self makeButtonSelected:touches];
    //    开始点击,判断鼠标是否点击了按钮,如果有,那么设置按钮为选中状态
    //    获取鼠标的位置
    UITouch *touch = [touches anyObject];
    //    将按钮的点击事件去掉,让view 来接收点击事件
    CGPoint curPoint = [touch locationInView:self];
    
//    _curPoint = curPoint;
    
    //    遍历按钮,判断鼠标是否在按钮内
    for (UIButton *btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, curPoint)){
            
            btn.selected = YES;
            [self.btnMuArray addObject:btn];
        };
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self makeButtonSelected:touches];
    //    开始点击,判断鼠标是否点击了按钮,如果有,那么设置按钮为选中状态
    //    获取鼠标的位置
    UITouch *touch = [touches anyObject];
    //    将按钮的点击事件去掉,让view 来接收点击事件
    CGPoint curPoint = [touch locationInView:self];
    
    _curPoint = curPoint;
    
    //    遍历按钮,判断鼠标是否在按钮内
    for (UIButton *btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, curPoint)){
//            判断按钮是否已经被选中
            if (btn && btn.selected == NO){
                btn.selected = YES;
                [self.btnMuArray addObject:btn];
            };
           
        };
    }

//    移动的时候,按钮之间划线
    [self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    遍历储存选中按钮的数组
    for (UIButton *btn in self.btnMuArray) {
        NSLog(@"%zd",btn.tag);
        btn.selected = NO;
    }
    [self.btnMuArray removeAllObjects];
    [self setNeedsDisplay];
}

/**
 让按钮变成选中状态
 */
- (void)makeButtonSelected:(NSSet<UITouch *> *)touches{
    //    开始点击,判断鼠标是否点击了按钮,如果有,那么设置按钮为选中状态
    //    获取鼠标的位置
    UITouch *touch = [touches anyObject];
    //    将按钮的点击事件去掉,让view 来接收点击事件
    CGPoint curPoint = [touch locationInView:self];
    
    _curPoint = curPoint;
    
    //    遍历按钮,判断鼠标是否在按钮内
    for (UIButton *btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, curPoint)){
            btn.selected = YES;
            [self.btnMuArray addObject:btn];
        };
    }
}

- (void)drawRect:(CGRect)rect {
    if (self.btnMuArray.count == 0) return;
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (UIButton *btn in self.btnMuArray) {
        if (btn.tag == 0) {
            [path moveToPoint:btn.center];
        }else{
            [path addLineToPoint:btn.center];
        }
    }
    [path setLineWidth:10];
    [[UIColor redColor] set];
    [path setLineJoinStyle:kCGLineJoinRound];
    [path addLineToPoint:self.curPoint];
    [path stroke];
}


@end
