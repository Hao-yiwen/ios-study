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
        [self.contentView addSubview:_customLabel];
        [NSLayoutConstraint activateConstraints:@[
            [_customLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
            [_customLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:15]
        ]];
        
        _customButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _customButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_customButton setTitle:@"删除" forState:UIControlStateNormal];
        [_customButton addTarget:self action:@selector(handleDeleteButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_customButton];
        [NSLayoutConstraint activateConstraints:@[
            [_customButton.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
            [_customButton.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-25],
            [_customLabel.heightAnchor constraintEqualToConstant:30],
            [_customLabel.widthAnchor constraintEqualToConstant:60]
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
