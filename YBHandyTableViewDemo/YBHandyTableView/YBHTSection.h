//
//  YBHTSection.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YBHTCellProtocol.h"
#import "YBHTCellConfigProtocol.h"
#import "YBHTHeaderFooterProtocol.h"
#import "YBHTHeaderFooterConfigProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface YBHTSection : NSObject

/** UITableView 的 header 配置 */
@property (nonatomic, strong, nullable) id<YBHTHeaderFooterConfigProtocol> headerConfig;

/** UITableView 的 footer 配置 */
@property (nonatomic, strong, nullable) id<YBHTHeaderFooterConfigProtocol> footerConfig;

/** UITableView 的 cell 配置数组 */
@property (nonatomic, strong, readonly) NSMutableArray<id<YBHTCellConfigProtocol>> *rowArray;

@end

NS_ASSUME_NONNULL_END
