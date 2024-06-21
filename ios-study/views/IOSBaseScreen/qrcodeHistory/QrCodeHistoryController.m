//
//  QrCodeHistoryController.m
//  ios-study
//
//  Created by 郝宜文 on 2024/6/19.
//

#import <Foundation/Foundation.h>
#import "QrCodeHistoryController.h"
#import "QrCodeHistoryController+TableView.h"
#import "CustomTableCellView.h"
#import "ios_study-Swift.h"
@implementation QrCodeHistoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"扫码历史";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[CustomTableCellView class] forCellReuseIdentifier:@"cell"];
    [self loadQrcodes];
}

- (void)loadQrcodes{
    self.qrcodes = [DataStoreUtils fetchAllQrcode];
    NSLog(@"loadQrcodes: %@", self.qrcodes);
}

@end
