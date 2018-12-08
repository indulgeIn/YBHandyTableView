//
//  UITableView+YBHandyTableView.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/11/18.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBHTConfigurator.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (YBHandyTableView)

@property (nonatomic, strong, readonly) NSMutableArray<YBHTConfigurator *> *ybht_dataArray;

- (void)ybht_addDelegate:(id<UITableViewDelegate>)delegate;
- (void)ybht_addDataSource:(id<UITableViewDataSource>)dataSource;

@end

NS_ASSUME_NONNULL_END
