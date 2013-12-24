//
//  FLAttachmentView.m
//  DynamicDemo
//
//  Created by Liu Feng on 13-12-24.
//  Copyright (c) 2013年 Liu Feng. All rights reserved.
//

#import "FLAttachmentView.h"

@interface FLAttachmentView ()
{
    UIAttachmentBehavior *_attachment;
}
@end

@implementation FLAttachmentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 1. 添加拖动手势
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        
        [self addGestureRecognizer:pan];
        
        // 2. 添加附着行为
        UIOffset offset = UIOffsetMake(25, 25);
        _attachment = [[UIAttachmentBehavior alloc] initWithItem:self.box offsetFromCenter:offset attachedToAnchor:CGPointMake(self.box.center.x, self.box.center.y - 100)];
        
        [self.animator addBehavior:_attachment];
        
        // 3. 添加锚点图像
        
    }
    return self;
}

- (void)pan:(UIPanGestureRecognizer *)gesture
{
    if (UIGestureRecognizerStateChanged == gesture.state) {
        
        _attachment.anchorPoint = [gesture locationInView:self];
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
