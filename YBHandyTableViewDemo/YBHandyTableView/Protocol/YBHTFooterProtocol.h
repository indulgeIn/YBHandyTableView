//
//  YBHTFooterProtocol.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YBHTFooterModelProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol YBHTFooterProtocol <NSObject>

@required

- (void)ybht_setFooterModel:(id<YBHTFooterModelProtocol>)model;

+ (CGFloat)ybht_heightForFooterWithModel:(id<YBHTFooterModelProtocol>)model;

@end

NS_ASSUME_NONNULL_END
