//
//  CustomTableCellView.m
//  ios-study
//
//  Created by 郝宜文 on 2024/6/21.
//

#import <UIKit/UIKit.h>
#import "CustomTableCellView.h"

@implementation CustomTableCellView

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        _customLabel = [[UILabel alloc] init];
        _customLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _customLabel.numberOfLines = 0; // 允许多行
        _customLabel.lineBreakMode = NSLineBreakByWordWrapping; // 按单词换行
        _customLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_customLabel];

        [NSLayoutConstraint activateConstraints:@[
            [_customLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10],
            [_customLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:15],
            [_customLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-55],
        ]];

        // 设置 content hugging 和 compression resistance 优先级
        [_customLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_customLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        
        // 添加customDesciption
        _customDesciption = [[UILabel alloc] init];
        _customDesciption.translatesAutoresizingMaskIntoConstraints = NO;
        _customDesciption.font = [UIFont systemFontOfSize:12];
        _customDesciption.textColor = [UIColor grayColor];
        [self.contentView addSubview:_customDesciption];
        [NSLayoutConstraint activateConstraints:@[
            [_customDesciption.topAnchor constraintEqualToAnchor:_customLabel.bottomAnchor constant:5],
            [_customDesciption.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:15],
            [_customDesciption.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-55],
            [_customDesciption.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-10],
            [_customDesciption.heightAnchor constraintEqualToConstant:20],
        ]];
        
        // 添加删除按钮
        _customButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _customButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_customButton setTitle:@"删除" forState:UIControlStateNormal];
        [_customButton addTarget:self action:@selector(handleDeleteButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_customButton];
        [NSLayoutConstraint activateConstraints:@[
            [_customButton.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
            [_customButton.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-25],
        ]];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    return [super initWithCoder:coder];;
}

#pragma mark 将删除按钮的处理操作委托给tabview
- (void)handleDeleteButton:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(deleteCell:didTapDeleteButton:)]) {
        [self.delegate deleteCell:self didTapDeleteButton:sender];
    }
}


@end
