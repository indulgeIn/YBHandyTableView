//
//  TCBannerModel.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TCBannerModel : NSObject <YBHTCellModelProtocol>
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *jumpUrl;
@end

NS_ASSUME_NONNULL_END
