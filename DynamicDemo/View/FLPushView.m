//
//  FLPushView.m
//  DynamicDemo
//
//  Created by Liu Feng on 13-12-24.
//  Copyright (c) 2013年 Liu Feng. All rights reserved.
//

#import "FLPushView.h"

@implementation FLPushView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 1. 添加手势识别
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self addGestureRecognizer:pan];
        
    }
    return self;
}

#pragma mark 滑动手势
- (void)pan:(UIPanGestureRecognizer *)gesture
{
    CGPoint location = [gesture locationInView:self];
    
    if (UIGestureRecognizerStateBegan == gesture.state) {
        NSLog(@"开始滑动");
    }else if (UIGestureRecognizerStateChanged == gesture.state){
        NSLog(@"正在滑动");
    }else if (UIGestureRecognizerStateEnded == gesture.state){
        
        // 添加推动行为
        UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[self.box] mode:UIPushBehaviorModeInstantaneous];
        
        [self.animator addBehavior:push];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
