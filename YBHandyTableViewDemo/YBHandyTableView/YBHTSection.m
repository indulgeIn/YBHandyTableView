//
//  YBHTSection.m
//  YBHandyTableView<https://github.com/indulgeIn/YBHandyTableView>
//
//  Created by 杨波 on 2018/12/8.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "YBHTSection.h"

@interface YBHTSection ()
@property (nonatomic, strong) NSMutableArray<id<YBHTCellConfigProtocol>> *rowArray;
@end

@implementation YBHTSection

#pragma mark - getter

- (NSMutableArray<id<YBHTCellConfigProtocol>> *)rowArray {
    if (!_rowArray) {
        _rowArray = [NSMutableArray array];
    }
    return _rowArray;
}

@end
