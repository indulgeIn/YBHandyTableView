//
//  YBHTHeaderFooterConfig.h
//  YBHandyTableView<https://github.com/indulgeIn/YBHandyTableView>
//
//  Created by 杨波 on 2019/4/11.
//  Copyright © 2019 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YBHTHeaderFooterConfigProtocol.h"
#import "YBHTHeaderFooterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface YBHTHeaderFooterConfig : NSObject <YBHTHeaderFooterConfigProtocol>

/// header/footer 对应的数据模型 (用于更新 UI 等)
@property (nonatomic, strong) id model;

/// header/footer 类类型
@property (nonatomic, strong) Class<YBHTHeaderFooterProtocol> headerFooterClass;

/// header/footer 的复用标识
@property (nonatomic, copy, nullable) NSString *headerFooterReuseIdentifier;

@end

NS_ASSUME_NONNULL_END
