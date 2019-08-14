//
//  GTNormalTableViewCell.m
//  test
//
//  Created by wuwei on 2019/8/10.
//  Copyright © 2019 wuwei. All rights reserved.
//

#import "GTNormalTableViewCell.h"

@interface GTNormalTableViewCell()

@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *sourceLabel;
@property(nonatomic, strong, readwrite) UILabel *commentLabel;
@property(nonatomic, strong, readwrite) UILabel *timeLabel;
@property(nonatomic, strong, readwrite) UIImageView *rightImageView;
@property(nonatomic, strong, readwrite) UIButton *deselectBtn;

@end

@implementation GTNormalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutTableViewCell {
    self.titleLabel.text = @"主标题ios开发";
    self.sourceLabel.text = @"今日头条";
    [self.sourceLabel sizeToFit];

    self.commentLabel.text = @"评论3";
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = @"2019-3-4";
    [self.timeLabel sizeToFit];
     self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 15, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
    self.rightImageView.image = [UIImage imageNamed:@"./icon.bunlde/like@2x.png"];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if(self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 80, 50, 20)];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 80, 50, 20)];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];

            self.timeLabel;
        })];
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(290, 20, 100, 60)];
            self.rightImageView.backgroundColor = [UIColor redColor];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;

            self.rightImageView;
        })];
        [self.contentView addSubview:({
            self.deselectBtn = [[UIButton alloc] initWithFrame:CGRectMake(290, 80, 30, 20)];
            self.deselectBtn.backgroundColor = [UIColor blueColor];
            [self.deselectBtn setTitle:@"x" forState:UIControlStateNormal];
            [self.deselectBtn setTitle:@"v" forState:UIControlStateHighlighted];
            [self.deselectBtn addTarget:self action:@selector(deselectBtnClick) forControlEvents:UIControlEventTouchUpInside];
            self.deselectBtn.layer.cornerRadius = 10;
            self.deselectBtn.layer.masksToBounds = YES;
            self.deselectBtn.layer.borderColor = [UIColor lightTextColor].CGColor;
            self.deselectBtn;
        })];

        
    }
    return self;
}

-(void) deselectBtnClick{
    NSLog(@"button click");
    if(self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:self.deselectBtn];
    }
}
@end
