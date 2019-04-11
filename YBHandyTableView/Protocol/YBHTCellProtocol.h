//
//  YBHTCellProtocol.h
//  YBHandyTableView<https://github.com/indulgeIn/YBHandyTableView>
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YBHTCellConfigProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol YBHTCellProtocol <NSObject>

@required

/**
 传递配置对象给 header/footer (根据配置对象拿到数据更新UI)

 @param config 配置对象
 */
- (void)ybht_setCellConfig:(id<YBHTCellConfigProtocol>)config;

/**
 获取 cell 的高度
 
 @param config 配置对象
 @param reuseIdentifier 复用标识
 @param indexPath indexPath
 @return 高度
 */
+ (CGFloat)ybht_heightForCellWithConfig:(id<YBHTCellConfigProtocol>)config reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath;

@optional

/**
 刷新 tableView
 */
@property (nonatomic, copy) void(^ybht_reloadTableView)(void);

@end

NS_ASSUME_NONNULL_END
