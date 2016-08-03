//
//  SZAnimation.h
//  SZTrasitionAnimation
//
//  Created by sz on 16/8/1.
//  Copyright © 2016年 悠然Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum : NSInteger{
    
    Fade = 1,           //淡入淡出
    Push ,              //推挤
    Reveal ,            //揭开
    MoveIn ,            //覆盖
    Cube ,              //立方体
    SuckEffect ,        //吮吸
    OglFlip ,           //翻转
    RippleEffect ,      //波纹
    PageCurl ,          //翻页
    PageUnCurl ,        //反翻页
    CameraIrisHollowOpen, //开镜头
    CameraIrisHollowClose,//关镜头
    CurlDown ,          //下翻页
    CurlUp ,            //上翻页
    FlipFromLeft ,      //左翻页
    FlipFromRiht ,      //右翻页
    
}AnimationType;
typedef enum : NSInteger{
    
    Left = 1,
    Top,
    Right,
    Bottom,
    
    
}SubType;

@interface SZAnimation : NSObject

/*
 动画的开始与结束的快慢,有五个预置分别为(下同):
 
 kCAMediaTimingFunctionLinear            线性,即匀速
 kCAMediaTimingFunctionEaseIn            先慢后快
 kCAMediaTimingFunctionEaseOut           先快后慢
 kCAMediaTimingFunctionEaseInEaseOut     先慢后快再慢
 kCAMediaTimingFunctionDefault           实际效果是动画中间比较快.
 */

@property (nonatomic, strong) CAMediaTimingFunction *timingFunction;

//设置动画时间
@property (nonatomic, assign) double duration;

//动画开始方向 上下左右
@property (nonatomic, assign) SubType subtype;

//动画种类
@property (nonatomic, assign) AnimationType animationType;

//方法
-(void)animationDidStartAnimationView:(UIView *)view;

@end
