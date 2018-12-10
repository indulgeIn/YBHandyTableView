//
//  YBHTSection.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YBHTCellProtocol.h"
#import "YBHTCellModelProtocol.h"
#import "YBHTHeaderFooterProtocol.h"
#import "YBHTHeaderFooterModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface YBHTSection : NSObject

/** UITableView 的 header 对应的 model */
@property (nonatomic, strong) id<YBHTHeaderFooterModelProtocol> headerModel;

/** UITableView 的 footer 对应的 model */
@property (nonatomic, strong) id<YBHTHeaderFooterModelProtocol> footerModel;

/** UITableView 的 cell 对应的 model 集合 */
@property (nonatomic, strong, readonly) NSMutableArray<id<YBHTCellModelProtocol>> *rowArray;

@end

NS_ASSUME_NONNULL_END
