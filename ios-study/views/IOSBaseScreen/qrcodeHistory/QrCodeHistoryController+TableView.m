//
//  QrCodeHistoryController+TableView.m
//  ios-study
//
//  Created by 郝宜文 on 2024/6/21.
//

#import "QrCodeHistoryController+TableView.h"
#import "CustomTableCellView.h"
#import "ios_study-Swift.h"

@implementation QrCodeHistoryController (TableView)

# pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    CustomTableCellView *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Qrcode* qrcode = self.qrcodes[indexPath.row];
    cell.customLabel.text = qrcode.qrcode;
    cell.customDesciption.text = qrcode.describe;
    cell.delegate = self;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return self.qrcodes.count;
}

# pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Row %ld selected", (long)indexPath.row);
}

- (void)deleteCell:(CustomTableCellView *)cell didTapDeleteButton:(UIButton*)button{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    if (indexPath) {
        // 在数据源中删除该行的数据
        NSLog(@"删除按钮点击，行号：%ld url: %@", (long)indexPath.row, self.qrcodes[indexPath.row].qrcode);
        
        // 然后在表视图中删除该行
        [DataStoreUtils deleteQrcodeWithQrcode:self.qrcodes[indexPath.row]];
        [self viewDidLoad];
    }
}

@end
