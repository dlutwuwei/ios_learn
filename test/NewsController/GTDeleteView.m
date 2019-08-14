//
//  GTDeleteView.m
//  test
//
//  Created by wuwei on 2019/8/14.
//  Copyright © 2019 wuwei. All rights reserved.
//

#import "GTDeleteView.h"

@interface GTDeleteView()

@property(nonatomic, strong, readwrite) UIView *backgroundView;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;
@property(nonatomic, copy, readwrite) dispatch_block_t deleteBlock;

@end

@implementation GTDeleteView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self addSubview:({
            _backgroundView = [[UIView alloc]initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.5;
            [_backgroundView addGestureRecognizer:({
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissDeleteView)];
                tap;
            })];
            _backgroundView;
        })];
        [self addSubview:({
            _deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
            _deleteButton.backgroundColor = [UIColor blackColor];
            _deleteButton;
        })];
    }
    return self;
}

- (void) showDeleteView:(CGPoint) point clickBlock:(dispatch_block_t) clickBlock {
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    _deleteBlock = [clickBlock copy];
    _deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
         self.deleteButton.frame = CGRectMake(self.bounds.size.width/2 - 100, self.bounds.size.height/2 - 100, 200, 200);
    } completion:^(BOOL finished){
        NSLog(@"123");
    }];
}

-(void) dismissDeleteView {
    if(_deleteBlock) {
        _deleteBlock();
    }
    [self removeFromSuperview];
}
@end
