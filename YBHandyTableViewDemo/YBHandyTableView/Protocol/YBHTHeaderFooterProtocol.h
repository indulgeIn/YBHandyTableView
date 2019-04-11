//
//  YBHTHeaderFooterProtocol.h
//  YBHandyTableView<https://github.com/indulgeIn/YBHandyTableView>
//
//  Created by 杨波 on 2018/12/10.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YBHTHeaderFooterConfigProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol YBHTHeaderFooterProtocol <NSObject>

@required

/**
 传递配置对象给 header/footer (根据配置对象拿到数据更新UI)

 @param config 配置对象
 */
- (void)ybht_setHeaderFooterConfig:(id<YBHTHeaderFooterConfigProtocol>)config;

/**
 获取 header/footer 的高度

 @param config 配置对象
 @param reuseIdentifier 复用标识
 @param section section
 @return 高度
 */
+ (CGFloat)ybht_heightForHeaderFooterWithConfig:(id<YBHTHeaderFooterConfigProtocol>)config reuseIdentifier:(NSString *)reuseIdentifier section:(NSInteger)section;

@optional

/**
 刷新 tableView
 */
@property (nonatomic, copy) void(^ybht_reloadTableView)(void);

@end

NS_ASSUME_NONNULL_END
