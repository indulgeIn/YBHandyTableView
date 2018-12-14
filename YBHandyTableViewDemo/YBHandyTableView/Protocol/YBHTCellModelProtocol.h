//
//  YBHTCellModelProtocol.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YBHTCellModelProtocol <NSObject>

@required

/**
 对应 cell 的类
 */
- (Class<YBHTCellProtocol>)ybht_cellClass;

@optional

/**
 对应 cell 的复用标识符
 */
- (NSString *)ybht_cellReuseIdentifier;

@end

NS_ASSUME_NONNULL_END
