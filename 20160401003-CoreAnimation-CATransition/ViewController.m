//
//  ViewController.m
//  20160401003-CoreAnimation-CATransition
//
//  Created by Rainer on 16/4/1.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"

static int i = 1;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", i]];
}

/**
 *  触摸开始：转场动画必须和转场代码放在一起
 *  一下为转场动画的类型：type
 *      fade:交叉淡化过渡
 *      push:新视图把旧视图推出去
 *      moveIn:新视图移到旧视图上面
 *      reveal:将旧视图移开,显示下面的新视图
 *      cube:立方体翻滚效果
 *      oglFlip:上下左右翻转效果
 *      suckEffect:收缩效果，如一块布被抽走
 *      rippleEffect:水滴效果
 *      pageCurl:向上翻页效果
 *      pageUnCurl:向下翻页效果
 *      cameraIrisHollowOpen:相机镜头打开效果
 *      cameraIrisHollowClose:相机镜头关闭效果
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    /*******************以下被称为转场代码******************/
    // 1.索引操作
    if (i == 3)  i = 1; else i++;
    
    // 2.给图片视图赋值
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", i]];
    
    /*******************以下被称为转场动画******************/
    // 3.创建一个转场动画对象
    CATransition *transition = [CATransition animation];
    
    // 4.设置转场动画的属性
    // 4.1.设置转场动画的类型
    transition.type = @"cameraIrisHollowClose";
    // 4.2.设置转场动画的时长
    transition.duration = 0.25;
    
    // 5.将转场动画添加到图片视图上
    [self.imageView.layer addAnimation:transition forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
