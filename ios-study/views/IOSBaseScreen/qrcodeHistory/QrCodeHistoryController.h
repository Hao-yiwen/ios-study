//
//  QrCodeHistoryController.h
//  ios-study
//
//  Created by 郝宜文 on 2024/6/19.
//

#ifndef QrCodeHistoryController_h
#define QrCodeHistoryController_h
#import <UIKit/UIKit.h>
// 前向声明 Swift 类
@class Qrcode;

@interface QrCodeHistoryController : UIViewController

@property UITableView *tableView;

@property NSArray<Qrcode *> *qrcodes;

- (void)loadQrcodes;

@end

#endif /* QrCodeHistoryController_h */
