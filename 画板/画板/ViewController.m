//
//  ViewController.m
//  画板
//
//  Created by 丁瑞瑞 on 2/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet DrawView *drawView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//清屏
- (IBAction)clear:(UIBarButtonItem *)sender {
    [self.drawView clear];
}
//撤销
- (IBAction)back:(UIBarButtonItem *)sender {
    [self.drawView back];
}
//橡皮擦
- (IBAction)earuse:(UIBarButtonItem *)sender {
    [self.drawView earuse];
}
//保存
- (IBAction)save:(UIBarButtonItem *)sender {
    [self.drawView save];
}
//照片
- (IBAction)photo:(UIBarButtonItem *)sender {
    
}
//线宽
- (IBAction)value:(UISlider *)sender {
    self.drawView.lineW = sender.value;
}
//线的颜色
- (IBAction)lineColor:(UIButton *)sender {
    self.drawView.lineColor = sender.backgroundColor;
}

@end
