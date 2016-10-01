//
//  BackView.m
//  手势解锁
//
//  Created by 丁瑞瑞 on 1/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "BackView.h"

@implementation BackView


- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"Home_refresh_bg"];
    [image drawInRect:rect];
}


@end
