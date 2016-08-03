//
//  SZAnimation.m
//  SZTrasitionAnimation
//
//  Created by sz on 16/8/1.
//  Copyright © 2016年 悠然Mac. All rights reserved.
//

#import "SZAnimation.h"

@implementation SZAnimation

#pragma mark - CATransitionAnimation
-(void)transitionAnimationWithType:(NSString *)type subType:(NSString *)subtype ForView:(UIView *)view
{
    //创建对象
    CATransition *transition = [CATransition animation];
    
    //设置运动时间
    if (!_duration) {
        _duration = 0.7f;
    }
    transition.duration = _duration;
    
    //设置类型
    transition.type = type;
    
    //设置运动方向
    if (subtype != nil) {
        transition.subtype = subtype;
    }
    
    //设置运动速度
    if (!_timingFunction) {
        transition.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    }
    transition.timingFunction = _timingFunction;
    
    //给layer层添加动画
    [view.window.layer addAnimation:transition forKey:@"animation"];
}

#pragma mark - 动画的实现
-(void)animationWithView:(UIView *)view WithAnimationTransition:(UIViewAnimationTransition)transition
{
    [UIView animateWithDuration:_duration animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view.window cache:YES];
    }];
}

#pragma mark - 选择动画方式
-(void)animationDidStartAnimationView:(UIView *)view
{
    NSString *subTypeString = nil;
    if (!_subtype) {
        _subtype = Left;
    }
    switch (_subtype) {
        case 1:
            subTypeString = kCATransitionFromLeft;
            break;
        case 2:
            subTypeString = kCATransitionFromBottom;
            break;
        case 3:
            subTypeString = kCATransitionFromRight;
            break;
        case 4:
            subTypeString = kCATransitionFromTop;
            break;
            
        default:
            break;
    }
    
    if (!_animationType) {
        _animationType = Fade;
    }
    switch (_animationType) {
            //淡化效果
        case Fade:
            [self transitionAnimationWithType:kCATransitionFade subType:subTypeString ForView:view];
            break;
            //Push效果
        case Push:
            [self transitionAnimationWithType:kCATransitionPush subType:subTypeString ForView:view];
            break;
            //揭开效果
        case Reveal:
            [self transitionAnimationWithType:kCATransitionReveal subType:subTypeString ForView:view];
            break;
            //覆盖效果
        case MoveIn:
            [self transitionAnimationWithType:kCATransitionMoveIn subType:subTypeString ForView:view];
            break;
            //立方体效果
        case Cube:
            [self transitionAnimationWithType:@"cube" subType:subTypeString ForView:view];
            break;
            //吮吸效果
        case SuckEffect:
            [self transitionAnimationWithType:@"suckEffect" subType:subTypeString ForView:view];
            break;
            //翻转效果
        case OglFlip:
            [self transitionAnimationWithType:@"oglFlip" subType:subTypeString ForView:view];
            break;
            //波纹效果
        case RippleEffect:
            [self transitionAnimationWithType:@"rippleEffect" subType:subTypeString ForView:view];
            break;
            //翻页效果
        case PageCurl:
            [self transitionAnimationWithType:@"pageCurl" subType:subTypeString ForView:view];
            break;
            //反翻页效果
        case PageUnCurl:
            [self transitionAnimationWithType:@"pageUnCurl" subType:subTypeString ForView:view];
            break;
            //相机打开效果
        case CameraIrisHollowOpen:
            [self transitionAnimationWithType:@"cameraIrisHollowOpen" subType:subTypeString ForView:view];
            break;
            //相机关闭效果
        case CameraIrisHollowClose:
            [self transitionAnimationWithType:@"cameraIrisHollowClose" subType:subTypeString ForView:view];
            break;
            //下翻页效果
        case CurlDown:
            [self animationWithView:view WithAnimationTransition:UIViewAnimationTransitionCurlDown];
            break;
            //上翻页效果
        case CurlUp:
            [self animationWithView:view WithAnimationTransition:UIViewAnimationTransitionCurlUp];
            break;
            //左翻页效果
        case FlipFromLeft:
            [self animationWithView:view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
            break;
            //右翻页效果
        case FlipFromRiht:
            [self animationWithView:view WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];
            break;
            
        default:
            break;
    }
}





@end
