//
//  ViewController.m
//  画板
//
//  Created by 丁瑞瑞 on 2/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
#import "HandleImageView.h"
@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
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
    UIImagePickerController *pickVC = [[UIImagePickerController alloc] init];
    pickVC.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    pickVC.delegate = self;
    [self presentViewController:pickVC animated:YES completion:nil];
}
//线宽
- (IBAction)value:(UISlider *)sender {
    self.drawView.lineW = sender.value;
}
//线的颜色
- (IBAction)lineColor:(UIButton *)sender {
    self.drawView.lineColor = sender.backgroundColor;
}
#pragma mark - uiimagepickvcdelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
//    NSLog(@"%@",info);
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    HandleImageView *handleView = [[HandleImageView alloc] init];
    handleView.frame = self.drawView.bounds;
    handleView.image = image;
    handleView.reBlock = ^(UIImage *image){
        self.drawView.image = image;
    };
    [self.drawView addSubview:handleView];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
