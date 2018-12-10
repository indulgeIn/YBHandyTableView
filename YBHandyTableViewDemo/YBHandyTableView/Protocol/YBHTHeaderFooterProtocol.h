//
//  YBHTHeaderFooterProtocol.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/10.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YBHTHeaderFooterModelProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol YBHTHeaderFooterProtocol <NSObject>

@required

- (void)ybht_setHeaderFooterModel:(id<YBHTHeaderFooterModelProtocol>)model;

+ (CGFloat)ybht_heightForHeaderFooterWithModel:(id<YBHTHeaderFooterModelProtocol>)model reuseIdentifier:(NSString *)reuseIdentifier section:(NSInteger)section;

@end

NS_ASSUME_NONNULL_END
