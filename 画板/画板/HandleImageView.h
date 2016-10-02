//
//  HandleImageView.h
//  画板
//
//  Created by 丁瑞瑞 on 3/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HandleImageView : UIView
/** <#注释#>*/
@property (nonatomic,strong) UIImage *image;
/** <#注释#>*/
@property (nonatomic,copy) void(^reBlock)(UIImage *newImage);
@end
