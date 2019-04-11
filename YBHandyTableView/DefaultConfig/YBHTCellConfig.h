//
//  YBHTCellConfig.h
//  YBHandyTableView<https://github.com/indulgeIn/YBHandyTableView>
//
//  Created by 杨波 on 2019/4/11.
//  Copyright © 2019 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YBHTCellConfigProtocol.h"
#import "YBHTCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface YBHTCellConfig : NSObject <YBHTCellConfigProtocol>

/// cell 对应的数据模型 (用于更新 UI 等)
@property (nonatomic, strong) id model;

/// cell 的类类型
@property (nonatomic, strong) Class<YBHTCellProtocol> cellClass;

/// cell 的复用标识
@property (nonatomic, copy, nullable) NSString *cellReuseIdentifier;

@end

NS_ASSUME_NONNULL_END
