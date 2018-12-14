//
//  YBHTCellProtocol.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YBHTCellModelProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol YBHTCellProtocol <NSObject>

@required

/**
 给 cell 赋值数据
 */
- (void)ybht_setCellModel:(id<YBHTCellModelProtocol>)cModel;

/**
 返回 cell 的高度
 */
+ (CGFloat)ybht_heightForCellWithModel:(id<YBHTCellModelProtocol>)cModel reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath;

@optional

/**
 刷新 tableView
 */
@property (nonatomic, copy) void(^ybht_reloadTableView)(void);

@end

NS_ASSUME_NONNULL_END
