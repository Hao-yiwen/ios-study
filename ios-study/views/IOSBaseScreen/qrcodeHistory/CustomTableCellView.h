//
//  CustomTableCell.h
//  ios-study
//
//  Created by 郝宜文 on 2024/6/21.
//

#ifndef CustomTableCell_h
#define CustomTableCell_h

// 前向声明
@class CustomTableCellView;

@protocol CustomTableCellDelegate <NSObject>

- (void)deleteCell:(CustomTableCellView *)cell didTapDeleteButton:(UIButton*)button;

@end

@interface CustomTableCellView : UITableViewCell

@property UILabel *customLabel;

@property UIButton *customButton;

@property UILabel *customDesciption;

@property id<CustomTableCellDelegate> delegate;

- (void)handleDeleteButton:(UIButton *)sender;

@end


#endif /* CustomTableCell_h */
