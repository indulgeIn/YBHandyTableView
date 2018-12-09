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
#import "YBHTHeaderProtocol.h"
#import "YBHTHeaderModelProtocol.h"
#import "YBHTFooterProtocol.h"
#import "YBHTFooterModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface YBHTSection : NSObject

@property (nonatomic, strong) id<YBHTHeaderModelProtocol> headerModel;

@property (nonatomic, strong) id<YBHTFooterModelProtocol> footerModel;

@property (nonatomic, strong, readonly) NSMutableArray<id<YBHTCellModelProtocol>> *rowArray;

@end

NS_ASSUME_NONNULL_END
