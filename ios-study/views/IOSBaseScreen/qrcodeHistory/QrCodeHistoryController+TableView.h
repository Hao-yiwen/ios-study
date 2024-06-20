//
//  QrCodeHistoryController+TableView.h
//  ios-study
//
//  Created by 郝宜文 on 2024/6/21.
//

#ifndef QrCodeHistoryController_TableView_h
#define QrCodeHistoryController_TableView_h
#import "QrCodeHistoryController.h"
#import "CustomTableCellView.h"

@interface QrCodeHistoryController (TableView) <UITableViewDataSource, UITableViewDelegate, CustomTableCellDelegate>

@end

#endif /* QrCodeHistoryController_TableView_h */
