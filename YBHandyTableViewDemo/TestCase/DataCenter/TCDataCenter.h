//
//  TCDataCenter.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCBannerModel.h"
#import "TCListModel.h"
#import "TCFunctionModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TCDataCenter : NSObject

- (void)network_getTCListSuccess:(void(^)(NSArray<TCListModel *> *dataArray, TCBannerModel *bannerModel))success failed:(nullable void(^)(void))failed;

@end

NS_ASSUME_NONNULL_END
