//
//  ViewController.m
//  SZTrasitionAnimation
//
//  Created by sz on 16/8/1.
//  Copyright © 2016年 悠然Mac. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "SZAnimation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"girl1.jpg"]];
}

- (IBAction)pushAnimation:(UIButton *)sender {
    
    
    NSLog(@"%ld",sender.tag);
    SecondViewController *secondVc = [SecondViewController new];
    SZAnimation *animation = [SZAnimation new];
    
    //时间 如果不设置 默认是0.7f
    animation.duration = 3.0f;
    
    //动画方向 如果不设置 默认是左边
    animation.subtype = Left;
    
    //动画种类 如果不设置 默认是Fade类型
    animation.animationType = sender.tag;
    
    //默认也是这个 UIViewAnimationOptionCurveEaseInOut
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [animation animationDidStartAnimationView:self.view];
    
    [self.navigationController pushViewController:secondVc animated:NO];
    
    //present
//    [self presentViewController:secondVc animated:NO completion:nil];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
