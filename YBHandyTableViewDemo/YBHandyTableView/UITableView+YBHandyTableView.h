//
//  UITableView+YBHandyTableView.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/11/18.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBHTSection.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (YBHandyTableView)

/** 一个 section 情况，cell 配置数组 */
@property (nonatomic, strong, readonly) NSMutableArray<id<YBHTCellConfigProtocol>> *ybht_rowArray;

/** 一个 section 情况，header 配置 */
@property (nonatomic, strong, nullable) id<YBHTHeaderFooterConfigProtocol> ybht_headerConfig;

/** 一个 section 情况，footer 配置 */
@property (nonatomic, strong, nullable) id<YBHTHeaderFooterConfigProtocol> ybht_footerConfig;


/** 多个 section 情况，每个 YBHTSection 实例包含 cell/header/footer 配置*/
@property (nonatomic, strong, readonly) NSMutableArray<YBHTSection *> *ybht_sectionArray;


/**
 添加代理回调（注意组件使用多代理，谨慎使用）
 */
- (void)ybht_addDelegate:(id<UITableViewDelegate>)delegate;

/**
 添加代理回调（注意组件使用多代理，谨慎使用）
 通常情况下不需要使用这个方法
 */
- (void)ybht_addDataSource:(id<UITableViewDataSource>)dataSource;

@end

NS_ASSUME_NONNULL_END
