//
//  YBHTCellConfig.m
//  YBHandyTableView<https://github.com/indulgeIn/YBHandyTableView>
//
//  Created by 杨波 on 2019/4/11.
//  Copyright © 2019 杨波. All rights reserved.
//

#import "YBHTCellConfig.h"

@implementation YBHTCellConfig

#pragma mark - <YBHTCellConfigProtocol>

- (Class<YBHTCellProtocol>)ybht_cellClass {
    return self.cellClass;
}

- (NSString *)ybht_cellReuseIdentifier {
    return self.cellReuseIdentifier;
}

@end
