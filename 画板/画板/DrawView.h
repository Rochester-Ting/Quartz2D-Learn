//
//  DrawView.h
//  画板
//
//  Created by 丁瑞瑞 on 2/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView
/** lineW*/
@property (nonatomic,assign) CGFloat lineW;
/** LineColor*/
@property (nonatomic,strong) UIColor *lineColor;
//清屏
-(void)clear;
//撤销
-(void)back;
//橡皮擦
-(void)earuse;
//保存
-(void)save;
@end
