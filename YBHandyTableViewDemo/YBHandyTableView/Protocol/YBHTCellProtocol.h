//
//  YBHTCellProtocol.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YBHTCellModelProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol YBHTCellProtocol <NSObject>

@required

- (void)ybht_setCellModel:(id<YBHTCellModelProtocol>)model;

+ (CGFloat)ybht_heightForCellWithModel:(id<YBHTCellModelProtocol>)model;

@end

NS_ASSUME_NONNULL_END
