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

- (Class<YBHTCellProtocol>)ybht_cellClass;

@optional

- (NSString *)ybht_cellReuseIdentifier;

@end

NS_ASSUME_NONNULL_END
