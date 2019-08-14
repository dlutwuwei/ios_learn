//
//  GTNormalTableViewCell.h
//  test
//
//  Created by wuwei on 2019/8/10.
//  Copyright © 2019 wuwei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTNormalTableViewCellDelegate <NSObject>

- (void) tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

@interface GTNormalTableViewCell : UITableViewCell

@property(nonatomic, strong, readwrite) id<GTNormalTableViewCellDelegate> delegate;

- (void)layoutTableViewCell;
- (void)deselectBtnClick;
@end

NS_ASSUME_NONNULL_END
