//
//  GTDeleteView.h
//  test
//
//  Created by wuwei on 2019/8/14.
//  Copyright © 2019 wuwei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteView : UIView
- (void) showDeleteView;
- (void) showDeleteView:(CGPoint) point clickBlock:(dispatch_block_t) clickBlock;
@end

NS_ASSUME_NONNULL_END
