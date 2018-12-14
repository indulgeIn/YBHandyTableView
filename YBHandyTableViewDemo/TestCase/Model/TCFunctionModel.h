//
//  TCFunctionModel.h
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TCFunctionModel : NSObject <YBHTCellModelProtocol>

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL isBig;

@property (nonatomic, weak) id cellDelegate;

@end

NS_ASSUME_NONNULL_END
