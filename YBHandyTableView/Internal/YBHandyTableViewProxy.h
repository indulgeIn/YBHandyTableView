//
//  YBProxyManager.h
//  YBHandyTableView<https://github.com/indulgeIn/YBHandyTableView>
//
//  Created by 杨波 on 2018/4/24.
//  Copyright © 2018年 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YBHandyTableViewProxy : NSObject 

- (void)addTarget:(id)target;
- (void)removeTarget:(id)target;

@property (nonatomic, strong, readonly) NSPointerArray *targets;

@end
