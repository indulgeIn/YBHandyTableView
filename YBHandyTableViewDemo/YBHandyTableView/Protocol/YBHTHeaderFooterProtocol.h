//
//  YBHTHeaderFooterProtocol.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/10.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YBHTHeaderFooterModelProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol YBHTHeaderFooterProtocol <NSObject>

@required

/**
 给 header/footer 赋值数据
 */
- (void)ybht_setHeaderFooterModel:(id<YBHTHeaderFooterModelProtocol>)hfModel;

/**
 返回 header/footer 高度
 */
+ (CGFloat)ybht_heightForHeaderFooterWithModel:(id<YBHTHeaderFooterModelProtocol>)hfModel reuseIdentifier:(NSString *)reuseIdentifier section:(NSInteger)section;

@optional

/**
 刷新 tableView
 */
@property (nonatomic, copy) void(^ybht_reloadTableView)(void);

@end

NS_ASSUME_NONNULL_END
