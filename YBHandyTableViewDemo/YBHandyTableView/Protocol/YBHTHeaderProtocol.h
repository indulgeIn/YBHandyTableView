//
//  YBHTHeaderProtocol.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YBHTHeaderModelProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol YBHTHeaderProtocol <NSObject>

@required

- (void)ybht_setHeaderModel:(id<YBHTHeaderModelProtocol>)model;

+ (CGFloat)ybht_heightForHeaderWithModel:(id<YBHTHeaderModelProtocol>)model;

@end

NS_ASSUME_NONNULL_END
