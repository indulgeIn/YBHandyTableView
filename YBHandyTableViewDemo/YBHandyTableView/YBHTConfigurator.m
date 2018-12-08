//
//  YBHTConfigurator.m
//  YBHandyTableViewDemo
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "YBHTConfigurator.h"

@interface YBHTConfigurator ()
@property (nonatomic, strong) NSMutableArray<id<YBHTCellModelProtocol>> *cellModelArray;
@end

@implementation YBHTConfigurator


#pragma mark - getter

- (NSMutableArray<id<YBHTCellModelProtocol>> *)cellModelArray {
    if (!_cellModelArray) {
        _cellModelArray = [NSMutableArray array];
    }
    return _cellModelArray;
}

@end
