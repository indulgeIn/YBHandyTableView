//
//  YBHTCellConfigProtocol.h
//  YBHandyTableView<https://github.com/indulgeIn/YBHandyTableView>
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YBHTCellConfigProtocol <NSObject>

@required

/**
 获取 cell 的类类型

 @return 类类型
 */
- (Class<YBHTCellProtocol>)ybht_cellClass;

@optional

/**
 获取 cell 的复用标识

 @return 复用标识
 */
- (nullable NSString *)ybht_cellReuseIdentifier;

@end

NS_ASSUME_NONNULL_END
