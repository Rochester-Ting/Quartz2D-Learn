//
//  ViewController.m
//  绘制加载进度条
//
//  Created by 丁瑞瑞 on 29/9/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet DrawView *progressView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _slider.value = 0;
}
- (IBAction)slider:(UISlider *)sender {
    _progressLabel.text = [NSString stringWithFormat:@"%.2f%%",sender.value * 100];
    _progressView.value = sender.value;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
